function [ y ,anlysize_result,answer] = MLE_old( a_1,b_1,b_2,b_3,a_0,b1_0,b2_0,b3_0, canshu,FindTime,datetype)
%计算mt;分出日周月
% data=importdata(filename);
% FindTime(:,1)=data.textdata(:,4);
tmp=datenum(FindTime);
for i=1:length(tmp)
    tmp2{i,1}=datestr(tmp(i,1),'yyyy-mm-dd');
end
findDate=datenum(tmp2);
firstDay=min(findDate);
len=length(findDate);
lastDate=max(findDate)-firstDay;
date=findDate-firstDay;
mt=zeros(lastDate,1);
for i=1:lastDate
    for j=1:len
        if date(j,1)<=i
            mt(i,1)=mt(i,1)+1;
        else
            break;
        end
    end
end

mttmp(1,1)=mt(1,1);

if(strcmp(datetype,'month'))
    for i=31:30:length(mt)
        mttmp((i+29)/30,1)=mt(i,1);
    end
end
if(strcmp(datetype,'week'))
    for i=8:7:length(mt)
        mttmp((i+6)/7,1)=mt(i,1);
    end
end
if(strcmp(datetype,'day'))
    mttmp=mt;
end
clear mt;
mt=mttmp;
clear mttmp;

%开始MLE拟合
% 两段delayed+一段G-O
% canshu=0.9;
% 六层循环
%   1,2层 遍历变点 2->n-1
%   3,4,5,6 遍历a b1 b2 b3

bugcount=mt(1:ceil(length(mt)*canshu));
% t1=length(a);
% t2=length(a)+length(b);
% a_1=257.05;
% b_1=0.003;
% b_2=0.0510;
% b_3=0.060;
a=a_1;
b1=b_1;
b2=b_2;
b3=b_3;

%increment of a,b1,b2 and b3
% a_0=0.0001;
% b1_0=0.001;
% b2_0=0.001;
% b3_0=0.001;
LLF_max=-9999;
a_hat=a;
b1_hat=b1;
b2_hat=b2;
b3_hat=b3;
t1_hat = 1;
t2_hat = 2;
tmp=1;
B=zeros(length(bugcount),1);
LLF_con=zeros(length(bugcount)-1,1);

        for x=0:10
            a=a_1+a_0*(x);
            for y=0:1
                b1=b_1+b1_0*(y);
                for i=0:1
                    b2=b_2+b2_0*(i);
                    for j=0:1
                        b3=b_3+b3_0*(j);
                        B(1)=(1+b1)*exp(-b1);
                        for t1 = 2 : length(bugcount) -1
                            fprintf('%d %d\n', t1, length(bugcount));
                            for t2 = t1 + 1 : length(bugcount)
                                for t=2:length(bugcount) %求解极大似然函数
                                    if t<t1
                                        B(t)=(1+b1*t).*exp(-b1*t);
                                    elseif (t>=t1)&&(t<t2)
                                        B(t)=(1+b1*t1+b2*(t-t1)).*exp(-b1*t1-b2*(t-t1));
                                    elseif t>=t2
                                        B(t)=(1+b1*t1+b2*(t2-t1)).*exp(-b1*t1-b2*(t2-t1)-b3*(t-t2));
                                    end
                                     LLF_con(t-1)=(bugcount(t)-bugcount(t-1))*log(B(t-1)-B(t))-log(factorial(bugcount(t)-bugcount(t-1)));
                                end
                        LLF_con_sum=sum(LLF_con)+log(a)*max(bugcount)-a*(1-B(length(bugcount)));
        %                 MLE_result(tmp,:)=[x,a,b1,b2,b3,LLF_con_sum];
                        tmp=tmp+1;
                        if isreal(LLF_con_sum)==0
                            break;
                        elseif LLF_max<LLF_con_sum
                            LLF_max=LLF_con_sum;
                            a_hat=a;
                            b1_hat=b1;
                            b2_hat=b2;
                            b3_hat=b3;
                            t1_hat = t1
                            t2_hat = t2
                        else
                        end
                    end
                end
            end
        end
    end
end
fprintf('over\n');


MLE_beta=[a_hat,b1_hat,b2_hat,b3_hat,LLF_max];
clear a_hat b1_hat b2_hat b3_hat
clear a a_0 b1 b1_0 b2 b2_0 b3 b3_0
clear a_1 b_1 b_2 b_3
clear LLF_max LLF_con LLF_con_sum B


beta=MLE_beta(1:4);
x=1:length(mt);
x=x';
% %delay+delay+G-O
c1 = beta(1).*(1-(1+beta(2)*x(1:t1)).*exp(-beta(2)*x(1:t1)));
c2 = beta(1).*(1-(1+beta(2)*t1+beta(3)*(x((t1+1):t2)-t1)).*exp(-beta(2)*t1-beta(3)*(x((t1+1):t2)-t1)));
c3 = beta(1).*(1-(1+beta(2)*t1+beta(3)*(t2-t1)).*exp(-beta(2)*t1-beta(3)*(t2-t1)).*exp(-beta(4)*(x((t2+1):length(mt))-t2)));

cfit(1:t1)=c1;
cfit((t1+1):t2)=c2;
cfit((t2+1):length(mt))=c3;

% figure
% [a,b,c]=Em(mt);
% plot(mt);
% hold on;
% plot(x,cfit,'r-')
y=cfit';
%拟合分析
real_data=mt;
cfit=y;
nihe_len=ceil(canshu*length(real_data));
junzhi=sum(real_data(1:nihe_len,1))/length(real_data);
tmp1=zeros(nihe_len,1);
tmp2=zeros(nihe_len,1);
for i=1:1:nihe_len
    tmp1(i,1)=(real_data(i,1)-cfit(i,1))^2;  
    tmp2(i,1)=(real_data(i,1)-junzhi)^2;
end
SSE=sum(tmp1); %和方差
MSE=SSE/nihe_len; %均方差
RMSE=sqrt(MSE); %均方根
R_squre=1-SSE/sum(tmp2);%回归曲线方程的相关指数 预测差值除以实际差值
anlysize_result=[SSE;MSE;RMSE;R_squre];
answer=MLE_beta';


end


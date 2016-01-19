function [ y,anlysize_result,answer ] = MLED( a_1,b_1,a_0,b1_0,canshu,FindTime,datetype)
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
% delayed模型
% canshu=0.9;
bugcount=mt(1:ceil(length(mt)*canshu));
% t1=length(a);
% t2=length(a)+length(b);


% a_1=204.8;
% b_1=0.02;

a=a_1;
b1=b_1;


%increment of a,b1,b2 and b3
% a_0=0.01;
% b1_0=0.001;

LLF_max=-9999;
a_hat=a;
b1_hat=b1;

tmp=1;
B=zeros(length(bugcount),1);
LLF_con=zeros(length(bugcount)-1,1);
for x=0:100
    a=a_1+a_0*(x);
    for y=0:20
        b1=b_1+b1_0*(y);
        
        B(1)=(1+b1)*exp(-b1);
        for t=2:length(bugcount) %求解极大似然函数
            B(t)=(1+b1*t).*exp(-b1*t);
            LLF_con(t-1)=(bugcount(t)-bugcount(t-1))*log(B(t-1)-B(t))-log(factorial(bugcount(t)-bugcount(t-1)));
        end
        LLF_con_sum=sum(LLF_con)+log(a)*bugcount(length(bugcount))-a*(1-B(length(bugcount)));
        clear MLE_result
%         MLE_result(tmp,:)=[x,a,b1,LLF_con_sum];
        tmp=tmp+1;
        if isreal(LLF_con_sum)==0
            break;
        elseif LLF_max<LLF_con_sum
            LLF_max=LLF_con_sum;
            a_hat=a;
            b1_hat=b1;
        end
    end
%     display(x);
end

MLE_beta=[a_hat,b1_hat,LLF_max];
clear a_hat b1_hat
clear a a_0 b1 b1_0
clear a_1 b_1
clear LLF_max LLF_con LLF_con_sum B

beta=MLE_beta(1:2);
x=1:length(mt);
x=x';
%delay+delay+G-O
cfit = beta(1).*(1-(1+beta(2)*x).*exp(-beta(2)*x));
% figure
% [a,b,c]=Em(mt);
% hold on;
% plot(x,cfit,'r-')
y=cfit;
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


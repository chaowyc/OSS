function [ y ,y1,y2,y3] = Weekbug3( mt ,datetype)
[ y ] = Weekbug( mt ,datetype); %y 数组 代表相邻两天的bug数量的差值
plot(y,'k','LineWidth',1)
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
bugcount=mt(1:ceil(length(mt)*1));

cc=max(bugcount)/length(bugcount);%控制图的中心线 定义
ucl=cc+3*(cc^(1/3)); % 上控制线 
lcl=cc-3*(cc^(1/3)); % 下控制线
clear x;
%%扩展CC UCL LCL
x=1:length(bugcount);
y1=ucl*ones(1,length(bugcount));
y2=lcl*ones(1,length(bugcount));
y3=cc*ones(1,length(bugcount));
lines=[y1(1,1);y2(1,1);y3(1,1)];

plot(y1(1:length(y)),'k-.','LineWidth',1)
hold on
plot(y2(1:length(y)),'k-.','LineWidth',1)
hold on
plot(y3(1:length(y)),'k-.','LineWidth',1)
end


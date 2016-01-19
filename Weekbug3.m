function [ y ,y1,y2,y3] = Weekbug3( mt ,datetype)
[ y ] = Weekbug( mt ,datetype); %y ���� �������������bug�����Ĳ�ֵ
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

cc=max(bugcount)/length(bugcount);%����ͼ�������� ����
ucl=cc+3*(cc^(1/3)); % �Ͽ����� 
lcl=cc-3*(cc^(1/3)); % �¿�����
clear x;
%%��չCC UCL LCL
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


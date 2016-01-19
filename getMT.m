function [ y ] = getMT( FindTime ,datetype)
%%%将日期转化为yyyy-mm-dd格式
%%%转化好的日期放在tmp2 列向量中
tmp=datenum(FindTime);
j=1;
for i=1:length(tmp)
    tmp2{j,1}=datestr(tmp(i,1),'yyyy-mm-dd');
    j=j+1;
end

findDate=datenum(tmp2);
firstDay=min(findDate);%%起点
len=length(findDate);%%故障总数
lastDate=max(findDate)-firstDay;%%总天数
date=findDate-firstDay;%%平移firstday个距离
mt=zeros(lastDate,1);%%初始化
%% 求出mt 即随着时间的增加 发生故障的总数
for i=1:lastDate
    for j=1:len
        if date(j,1)<=i
            mt(i,1)=mt(i,1)+1;
        else
            break;
        end
    end
end
%%改变时间间距 day week month 
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
y(:,1)=mt;

end


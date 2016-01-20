function [ y ] = getMT( FindTime ,datetype)
%% 计算mt
%   输入：发现时间，时间间隔
%   输出：mt
%(C) 哈尔滨工业大学 计算机科学与技术-移动与容错计算中心

%% 将日期转化为 yyyy-mm-dd格式 转化的结果放入tmp2中
tmp=datenum(FindTime);
j=1;
for i=1:length(tmp)
    tmp2{j,1}=datestr(tmp(i,1),'yyyy-mm-dd');
    j=j+1;
end

%% 找到故障发现的起始时间和终止时间，并将所有故障发现时间平移，使起始时间为0day。
% 注意此时时间格式：
%   单位：day
%   len:故障总数
%   lastDate:故障发现的总时长（总天数）
%   date:天数的列向量
findDate=datenum(tmp2);
firstDay=min(findDate);
len=length(findDate);
lastDate=max(findDate)-firstDay;
date=findDate-firstDay;

%% 求出mt 即发生故障的累计数，单位为天
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

%% 改变时间间距 day week month 
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


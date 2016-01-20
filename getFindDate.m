function [FindDate]=getFindDate(filename)
%% 处理数据，只读findDate并转化为单位为天
%   输入：excel文件，要求第E列为故障发现时间
%   输出：按照失效发现先后顺序排列好的故障发现时间序列 FindDate
%
%(C) 哈尔滨工业大学 计算机科学与技术-移动与容错计算机实验中心

%% importdata:load data from file.
data=importdata(filename);

%% 取出故障发现时间 即第E列
Mydata(:,1)=data(:,5);

%% 处理数据 统一失效被发现时间的格式
% 例如
% 2015/10/29 15：55：65 -> 2015/10/29
% 2015/10/29    ->     2015/10/29
% datenum 给出0000年到给定时间的天数 
%   如：2015/10/29 到 0000/00/00的天数，设为n
% datestr 根据天数生成指定格式日期和时间
%   如：输入n，输出 2015/10/29

for i=1:length(Mydata)
    if(length(Mydata{i,1})<=10)
        FindDate{i,1}=datestr(floor(datenum(Mydata{i,1},'yyyy/mm/dd')),'yyyy/mm/dd');
    else
        FindDate{i,1}=datestr(floor(datenum(Mydata{i,1},'yyyy/mm/dd HH:MM:SS')),'yyyy/mm/dd');
    end
end

%% 按照是小发现时间排序
FindDate=sortrows(FindDate,1);
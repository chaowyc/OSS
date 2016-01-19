function [FindDate]=getFindDate(filename)
%读数据，只读findDate并转化为单位为天
%输入：excel文件，要求第E列为故障发现时间
data=importdata(filename);%importdata:oad data from file.
Mydata(:,1)=data(:,5);%取出故障发现时间 即第E列
for i=1:length(Mydata)
    if(length(Mydata{i,1})<=10)
        FindDate{i,1}=datestr(floor(datenum(Mydata{i,1},'yyyy/mm/dd')),'yyyy/mm/dd');%datenum 给出0000年到给定时间的天数 datestr-生成指定格式日期和时间
    else
        FindDate{i,1}=datestr(floor(datenum(Mydata{i,1},'yyyy/mm/dd HH:MM:SS')),'yyyy/mm/dd');
    end
end
%排序
FindDate=sortrows(FindDate,1);
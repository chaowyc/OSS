function [FindDate]=getFindDate(filename)
%�����ݣ�ֻ��findDate��ת��Ϊ��λΪ��
%���룺excel�ļ���Ҫ���E��Ϊ���Ϸ���ʱ��
data=importdata(filename);%importdata:oad data from file.
Mydata(:,1)=data(:,5);%ȡ�����Ϸ���ʱ�� ����E��
for i=1:length(Mydata)
    if(length(Mydata{i,1})<=10)
        FindDate{i,1}=datestr(floor(datenum(Mydata{i,1},'yyyy/mm/dd')),'yyyy/mm/dd');%datenum ����0000�굽����ʱ������� datestr-����ָ����ʽ���ں�ʱ��
    else
        FindDate{i,1}=datestr(floor(datenum(Mydata{i,1},'yyyy/mm/dd HH:MM:SS')),'yyyy/mm/dd');
    end
end
%����
FindDate=sortrows(FindDate,1);
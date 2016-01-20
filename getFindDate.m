function [FindDate]=getFindDate(filename)
%% �������ݣ�ֻ��findDate��ת��Ϊ��λΪ��
%   ���룺excel�ļ���Ҫ���E��Ϊ���Ϸ���ʱ��
%   ���������ʧЧ�����Ⱥ�˳�����кõĹ��Ϸ���ʱ������ FindDate
%
%(C) ��������ҵ��ѧ �������ѧ�뼼��-�ƶ����ݴ�����ʵ������

%% importdata:load data from file.
data=importdata(filename);

%% ȡ�����Ϸ���ʱ�� ����E��
Mydata(:,1)=data(:,5);

%% �������� ͳһʧЧ������ʱ��ĸ�ʽ
% ����
% 2015/10/29 15��55��65 -> 2015/10/29
% 2015/10/29    ->     2015/10/29
% datenum ����0000�굽����ʱ������� 
%   �磺2015/10/29 �� 0000/00/00����������Ϊn
% datestr ������������ָ����ʽ���ں�ʱ��
%   �磺����n����� 2015/10/29

for i=1:length(Mydata)
    if(length(Mydata{i,1})<=10)
        FindDate{i,1}=datestr(floor(datenum(Mydata{i,1},'yyyy/mm/dd')),'yyyy/mm/dd');
    else
        FindDate{i,1}=datestr(floor(datenum(Mydata{i,1},'yyyy/mm/dd HH:MM:SS')),'yyyy/mm/dd');
    end
end

%% ������С����ʱ������
FindDate=sortrows(FindDate,1);
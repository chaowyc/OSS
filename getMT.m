function [ y ] = getMT( FindTime ,datetype)
%% ����mt
%   ���룺����ʱ�䣬ʱ����
%   �����mt
%(C) ��������ҵ��ѧ �������ѧ�뼼��-�ƶ����ݴ��������

%% ������ת��Ϊ yyyy-mm-dd��ʽ ת���Ľ������tmp2��
tmp=datenum(FindTime);
j=1;
for i=1:length(tmp)
    tmp2{j,1}=datestr(tmp(i,1),'yyyy-mm-dd');
    j=j+1;
end

%% �ҵ����Ϸ��ֵ���ʼʱ�����ֹʱ�䣬�������й��Ϸ���ʱ��ƽ�ƣ�ʹ��ʼʱ��Ϊ0day��
% ע���ʱʱ���ʽ��
%   ��λ��day
%   len:��������
%   lastDate:���Ϸ��ֵ���ʱ������������
%   date:������������
findDate=datenum(tmp2);
firstDay=min(findDate);
len=length(findDate);
lastDate=max(findDate)-firstDay;
date=findDate-firstDay;

%% ���mt ���������ϵ��ۼ�������λΪ��
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

%% �ı�ʱ���� day week month 
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


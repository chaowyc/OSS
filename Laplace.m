function [ y, changePointCount ] = Laplace( FindTime ,dateType)
%% Laplace��ⷽ������
%   ����ÿ�ܵ�bug��Ŀ��Ȼ����ݹ�ʽu(i) = c - m / sqrt((t^2 - 1) / 12N(t)) �������p14
%   ���룺ʧЧ����ʱ��
%   �����U(t)
%(C) ��������ҵ��ѧ �������ѧ�뼼��-�ƶ����ݴ��������

%% ͨ��mt����ÿ�ܵ�bug��Ŀ
[ mt ] = getMT( FindTime ,dateType); 
bugcount=mt(1:ceil(length(mt)*1));
weekbug(1,1)=bugcount(1,1);
for i=2:1:length(bugcount)
    weekbug(i,1)=bugcount(i,1)-bugcount(i-1,1);
end

%% ����c
tmp(1,1)=0;
for i=2:1:length(bugcount)
    tmp(i,1)=tmp(i-1,1)+(i-1)*weekbug(i,1);
end

%% ���� u(i)
u=zeros(length(bugcount),1);
for i=1:1:length(bugcount)
    u(i,1)=(tmp(i,1)/bugcount(i,1)-0.5*(i-1))./sqrt((i^2)./(12*bugcount(i,1)));
end
y=u;

%% ����U�������жϱ��ĸ���
maxu = max(u);
lastu = u(length(bugcount), 1);
changePointCount = 1;
if maxu > 0 &&  lastu > 0
    changePointCount = 1;
elseif maxu > 0 && lastu < 0
    changePointCount = 2;
end

end
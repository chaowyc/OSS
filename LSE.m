%% ��С���˷�
%   ���ݼ�����
%   ���ݼ����ƣ�m(x) = a(1 - (1 + b*x)exp(-b*x))
%   Ŀ�꺯���� J(theta) = (1 / n)sum((m(x) - y)^2)
%   �ݶ��½���
% (C) ��������ҵ��ѧ �������ѧ�뼼��-�ƶ����ݴ��������

%% Get the data from files and scatter it
data=importdata('lab.xlsx');
x = zeros(size(data, 1), 0);
y = zeros(size(data, 1), 0);
x(:, 1) = data(:, 1);
y(:, 1) = data(:, 2);
figure;
scatter(x, y, 'k');
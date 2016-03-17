function [] = getFun3(mt, t1, t2, ratio)
%% ��������Է����� ��������
% input:
%   mt:
%   t1:��һ�����
%   t2:�ڶ������
%   ration: ѵ������ռ���ݼ��ı���
%(C) ��������ҵ��ѧ �������ѧ�뼼��-�ƶ����ݴ��������

%% ������������B(t) 
bugcount = mt(1:ceil(length(mt) * ratio));
b1 = sym('b1', 'real');
b2 = sym('b2', 'real');
B = zeros(length(bugcount), 1);

B(1) = (1 + b1) * exp(-b1);
for t = 2 : length(bugcount)    
    if t < t1
        B(t) = (1 + b1 * t).*exp(-b1 * t);
    elseif (t >= t1) && (t < t2)
        B(t) = (1 + b1 * t1 + b2 * (t - t1)).*exp(-b1 * t1 - b2 * (t - t1));
    elseif t >= t2
        B(t) = (1 + b1 * t1 + b2 * (t2 - t1)).*exp(-b1 * t1 - b2 * (t2 - t1) - b3 * (t - t2));
    end
end
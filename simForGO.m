function [time, mt] = simForGO(parameter)
%% GO ģ�ͷ�������
%
%(C) ��������ҵ��ѧ �������ѧ�뼼��-�ݴ����ƶ���������-����ƻ
% num = 400;   %����
% a = 497.8;
% b = 0.016;
num = parameter(11, 1)
a = parameter(1, 1)
b = parameter(3, 1)
time = eventGO(num,a,b);
for j = 1:num
    mt(j,1) = a*(1-exp(-b*j));
end
length(time)
length(mt)
% figure;
% plot(time);
% hold on;
% plot([1:num]', mt);
end
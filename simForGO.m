function [time, mt] = simForGO(parameter)
%% GO 模型仿真数据
%
%(C) 哈尔滨工业大学 计算机科学与技术-容错与移动计算中心-朱秋苹
% num = 400;   %天数
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
function [time, mt] = simForDSS(parameter)

% num = 100;   %ÌìÊý
% a = 137.2;
% b = 0.156;
num = parameter(11, 1)
a = parameter(1, 1)
b = parameter(3, 1)
time = eventDDS(num,a,b);
for j = 1:num
    mt(j,1) = a*(1-(1+b*j)*exp(-b*j));
end
%[time,t] = simulated(time, t);
% figure;
% plot(time);
% hold on;
% plot([1:num]',mt);
% title('DDS');
end
function [time, mt] = simFor2CP(parameter)
% num = 200;   %ÌìÊı
% a = 89.4;
% t1 = 84;
% t2 = 150;
% b1 = 0.018;
% b2 = 0.245;
% b3 = 0.072;
num = parameter(11, 1)
a = parameter(1, 1)
b1 = parameter(3, 1)
b2 = parameter(4, 1)
b3 = parameter(5, 1)
t1 = parameter(9, 1)
t2 = parameter(10, 1)

time = event2CP(num,a,b1,b2,b3,t1,t2);
for j = 1:num
    if(j <= t1)
        mt(j,1) = a*(1-(1+b1*j)*exp(-b1*j));
    elseif(t1 < j <= t2)
        mt(j,1) = a*(1-(1+b1*t1+b2*(j-t1))*exp(-b1*t1-b2*(j-t1)));
    elseif(j > t2)
        mt(j,1) = a*(1-(1+b1*t1+b2*(t2-t1)+b3*(j-t2))*exp(-b1*t1-b2*(t2-t1)-b3*(j-t2)));
    end
end
% figure;
% plot([1:num]', time,[1:num]', mt);
% hold on;
% title('2CP');
end
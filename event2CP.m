function [ SimMt ] = event2CP(num, a, b1, b2, b3, t1, t2)
%EVENT1CP Summary of this function goes here
%   Detailed explanation goes here
dt = 0.001;
event = 0;
t = 0; %天数
SimMt = zeros(num, 1); %仿真结果
tmp = 0.0;
while(t < num)
    while(tmp <= t)
        if(tmp <= t1)
            x = a*b1*b1*t*exp(-b1*tmp);
        elseif( tmp > t1 & tmp <= t2)
            %x = a*(b2*(1+b1*t1-b2*t1)-b2+b2*b2*t)*exp(-b1*t1-b2*(t-t1));
            x = a * b2 * (b1 * t1 + b2 * tmp - b2 * t1) * exp(-b1*t1-b2*(tmp-t1));
        else 
            %x = a*b3*(b3*t+b1*t1+b2*(t2-t1)-b3*t2)*exp(-b1*t1-b2*(t2-t1)-b3*(t-t2));
            x = a * (b1 * b3 - b2 * b3 * (t1 -t1) - b3 * b3 - b3 * b3 * t2) * exp(-b1*t1-b2*(t2-t1)-b3*(tmp-t2));
        end
        rad = rand(1,1);
        if(rad < x*dt)
            event = event + 1;
            fprintf('%d\n', event);
        end
        tmp = tmp + dt;
    end
    tmp = t;
    t = t + 1;
    SimMt(t, 1) = event;
end
end
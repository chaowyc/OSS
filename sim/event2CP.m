function [ t ] = event2CP(t, a, b1, b2, b3, t1, t2)
%EVENT1CP Summary of this function goes here
%   Detailed explanation goes here
dt = 0.1;
event = 0;
while(true)
%while(event == 0)
    if(t <= t1)
        x = a*b1*b1*t*exp(-b1*t);
    elseif( t > t1 & t <= t2)
        %x = a*(b2*(1+b1*t1-b2*t1)-b2+b2*b2*t)*exp(-b1*t1-b2*(t-t1));
        x = a * b2 * (b1 * t1 + b2 * t - b2 * t1) * exp(-b1*t1-b2*(t-t1));
    else
        %x = a*b3*(b3*t+b1*t1+b2*(t2-t1)-b3*t2)*exp(-b1*t1-b2*(t2-t1)-b3*(t-t2));
        x = a * (b1 * b3 - b2 * b3 * (t1 -t1) - b3 * b3 - b3 * b3 * t2) * exp(-b1*t1-b2*(t2-t1)-b3*(t-t2));
    end
    rad = rand(1,1);
    if(rad < x*0.1)
        event = event + 1;
        break;
    end
    t = t + dt;
end


end




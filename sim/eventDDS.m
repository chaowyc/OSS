function [ t ] = eventDDS( t, a, b )
%produce G-O model 's time when error occurs

dt = 1;
event = 0;
while(event == 0)
    x = a*b*b*t*exp(-b*t);
    rad = rand(1,1);
    if(rad < x*dt)
        event = event + 1;
    end
    t = dt+t;
    
end






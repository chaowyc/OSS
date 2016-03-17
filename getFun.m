function [ mt ] = getFun(x, theta)
    %factor = zeros(length(x), 1);
    factor = exp(-theta(2, 1) * x);
    mt = theta(1, 1) - theta(1, 1) * factor - theta(1, 1) * theta(2, 1) * x * factor;
end
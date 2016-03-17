function LSEgetFit(x, y)
    %% ≥ı ºªØtheta
    theta = ones(2, 1);
    mt = getFun(x, theta);
    for i = 1 : 1000
        theta(1, 1) = theta(1, 1) - (alpha / n) * (mt - y) * (1 - (1 + theta(2, 1) * x) * exp(-theta(2, 1) * x));
        theta(2, 1) = theta(2, 1) + (alpha / n) * (mt - y) * (1 + theta(2, 1)^2) * theta(1, 1) * x * exp(-theta(2, 1) * x)
    end
end
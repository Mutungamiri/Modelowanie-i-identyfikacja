function [f] = f_norm(x)
    f = 1 / sqrt(2 * pi) * exp(-x .^ 2 / 2);
end

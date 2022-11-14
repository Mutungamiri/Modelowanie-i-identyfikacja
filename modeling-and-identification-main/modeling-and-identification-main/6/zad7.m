function [Z] = zad7(a, b, N)
    cauchy = @(p, a, b) a + b .* tan(pi * (p - 0.5));
    defaultCauchy = @(p) cauchy(p, a, b);
    Z = defaultCauchy(rand(N,1));
end
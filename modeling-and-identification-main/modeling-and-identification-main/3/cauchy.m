function [Z] = cauchy(a, b, N)
  c = @(p, a, b) a + b .* tan(pi * (p - 0.5));
  p = rand(N,1);
  Z = c(p, a, b);
end


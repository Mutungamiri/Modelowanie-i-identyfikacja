close all; clear; clc;
N = 100000;
mu = 0; sigma = 1;
T = normrnd(mu, sigma, N, 1);

uN  = @(X) sum(X) / length(X);
s2N = @(X) sumsqr(X - uN(X)) / length(X);
S2N = @(X) sumsqr(X - uN(X)) / (length(X) - 1);
switch 3
    case 1
        vec_n = 1 : 1000;
        vec_u = zeros(size(vec_n));
        vec_s = zeros(size(vec_n));
        vec_S = zeros(size(vec_n));
        for n = vec_n
            T = normrnd(mu, sigma, n, 1);
            vec_u(n) = uN(T);
            vec_s(n) = s2N(T);
            vec_S(n) = S2N(T);
        end
        figure;histogram(vec_u);
        figure;histogram(vec_s);
        figure;histogram(vec_S);
    case 2
        L = 12;
        zad2(L, uN, 1);
        zad2(L, s2N, 2);
        zad2(L, S2N, 2);
        L = 25;
        zad2(L, uN, 1);
        zad2(L, s2N, 2);
        zad2(L, S2N, 2);
    case 3
        L = 12;
        zad3(L, uN, 1);
        zad3(L, s2N, 2);
        zad3(L, S2N, 2);
        L = 25;
        zad3(L, uN, 1);
        zad3(L, s2N, 2);
        zad3(L, S2N, 2);
end

function zad2(L, est, n)
  N = 1 : 1 : 1000;
  mu = 0; sigma = 1;
  error = zeros(length(N), 1);
  switch n
      case 1
          minus = mu;
      case 2
          minus = sigma;
  end
  for i = 1 : length(N)
      for j = 1 : L
          T = normrnd(mu, sigma, N(i), 1);
          error(i) = error(i) + (est(T) - minus)^2;
      end
      error(i) = error(i) / L;
  end
  figure
  plot(N, error);
  xlabel('N')
  switch n
      case 1
          ylabel('$Err\{ \hat{\mu_N};\mu \}$', 'Interpreter', 'Latex');
      case 2
          ylabel('$Err\{ \hat{\sigma^2_N};\sigma^2 \}$', 'Interpreter', 'Latex');
  end
end

function zad3(L, est, n)
  N = 1 : 1 : 100;
  mu = 0; sigma = 0.05;
  error = zeros(length(N), 1);
  switch n
      case 1
          minus = mu;
      case 2
          minus = sigma;
  end
  for i = 1 : length(N)
      for j = 1 : L
          T = cauchy(mu, sigma, N(i));
          error(i) = error(i) + (est(T) - minus)^2;
      end
      error(i) = error(i) / L;
  end
  figure
  plot(N, error);
  xlabel('N')
  switch n
      case 1
          ylabel('$Err\{ \hat{\mu_N};\mu \}$', 'Interpreter', 'Latex');
      case 2
          ylabel('$Err\{ \hat{\sigma^2_N};\sigma^2 \}$', 'Interpreter', 'Latex');
  end
end

close all; clear; clc;
N = 1000;
X = gen(N);

switch 1
    case 1
        histogram(X, 100);
    case 2
        x = linspace(eps, 1, N);
        F_est = zad2(N, X, x);
        F = x.^2;
        hold on;
        plot(x, F);
        plot(x, F_est);
        legend('F(x)','F_{N est}(x)');
        xlabel('x');
        ylabel('F(x)');
    case 3
        zad3();
    case 4
        zad4();
    case 6
        M = 100;
        L = 10 : 10 : 1000;
        x = rand(1, N);
        e = zeros(size(L));
        for i = 1 : length(L)
           e(i) = zad6(M, L(i), N, x);
        end
        plot(L, e)
        xlabel('L');
        ylabel('$Err\{ \hat{F_N} \}$', 'Interpreter', 'Latex');
        figure
        histogram(e)
        figure
        M = 100 : 10 : 1000;
        L = 10;
        x = rand(1, N);
        e = zeros(size(M));
        for i = 1 : length(M)
           e(i) = zad6(M(i), L, N, x);
        end
        plot(M, e)
        xlabel('M'); ylabel('$Err\{ \hat{F_N} \}$', 'Interpreter', 'Latex')
end

function [F_est] = zad2(N, X, x)
    I = @(a, b) a <= b;
    F_est = zeros(N, 1);
    for i = 1 : N
        F_est(i) = sum(I(X, x(i))) / N;
    end
end

function zad3()
    N = 1 : 1000;
    D_N = zeros(size(N));
    for i = 1 : length(N)
        x = linspace(eps, 1, N(i));
        F = x' .^ 2;
        X = gen(N(i));
        F_est = zad2(N(i), X, x);
        D_N(i) = max(abs(F_est - F));
    end
    figure
    plot(N, D_N)
    xlabel('N')
    ylabel('D_N')
end


function zad4()
    data = read('data.txt');
    N = [ 50 100 500 1000 ];
    %N = [1000];
    F_norm = @(mu,omega,x) 0.5 * (1 + erf(1 + (x - mu)/(omega * sqrt(2))));
    F_cauchy = @(x,x0,gamma) atan((x - x0) / gamma) / pi + 0.5;
    for n = N
        x = linspace(-30, 30, n);
        F_est = zad2(n, data, x);
        figure;
        plot(x, F_est);
        hold on;
        grid on; grid minor;
        norm = F_norm(1, 1, x);
                sum(min((F_est-norm).^2))
        plot(x, norm)
        norm = F_norm(0, 5, x);
                sum(min((F_est-norm).^2))
        plot(x, norm)
        norm = F_cauchy(x, 0, 1);
                sum(min((F_est-norm).^2))
        plot(x, norm)
        xlabel('x');
        ylabel('F(x)');
        legend(...
            'Rozkład z pliku txt',...
            'Normalny-N(1, 1)',...
            'Normalny-N(0, 5)',...
            'Rozkład Cauchyego',...
            'Location', 'northwest'...
            );
    end
end

function [error] = zad6(M, L, N, x)
  F_norm = @(mu,omega,x) 0.5 * (1 + erf(1 + (x - mu)/(omega * sqrt(2))));
  I = @(a, b) a <= b;
  error = 0;
  X = rand(1, N);
  for l = 1 : L
      F = F_norm(1, 1, x);
      F_est = zeros(1, N);
      for j = 1 : M
        F_est(j) = sum(I(X, x)) / N;
      end
      error = error + sumsqr(F_est - F);
  end
  error = error / (L * M);
end

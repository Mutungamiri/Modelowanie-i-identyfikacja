close all; clear; clc;
N = 500;
rozk_norm = zad1(N);
I = @(x)(x > -1) .* (x < 1);
% Boxcar, Gaussian, Epanechnikov Kernel
K = {
    @(x)(x > -0.5) .* (x < 0.5);
    @(x) exp(-x .* x / 2) / sqrt(2 * pi);
    @(x) 3/4 * (1 - x.^2) .* I(x);
};
switch 2
    case 2
        zad2(N, rozk_norm, I);
    case 3
        h = 0.3; x = linspace(-3, 5, N);
        str = sprintf("Rozkład normalny - N=%i, h_N=%g",N,h);
        zad3(x, N, rozk_norm, K, h, f_norm(x - 1), str);
        h = 0.3; x = linspace(-1, 2, N);
        str = sprintf("Rozkład jendostajny - N=%i, h_N=%g",N,h);
        zad3(x, N, rand(N, 1), K, h, f_jedn(x), str);
        h = 0.3; x = linspace(-2, 2, N);
        str = sprintf("Rozkład trójkątny - N=%i, h_N=%g",N,h);
        zad3(x, N, gen_rozk_tr(N, -1, 1, 1), K, h, f_tr(x), str);
    case 4
        a = -8; b = 8; M = 100; L = 10; 
        N = 100;
        x = linspace(a, b, M);
        h_N = 0.1 : 0.1 : 10;
        zad4(M, L, N, h_N, K{1}, x);
end

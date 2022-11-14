function [m_est, x] = zad3(X, Y, N, K, h)
    x = linspace(-2,2,N);
    m_est = estymator(x, X, Y, h, K);
end

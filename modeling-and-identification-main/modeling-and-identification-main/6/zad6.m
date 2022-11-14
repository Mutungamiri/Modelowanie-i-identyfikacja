function zad6(m, K, X, N, Y)
    h = zad5(m, K, Y, X); 
    [m_est, x] = zad3(X,Y,N,K,h);
    hold on;
    plot(x, m_est);
end
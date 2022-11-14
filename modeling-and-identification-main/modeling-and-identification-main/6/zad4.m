function zad4(X, Z, m, K, N, range, a, t)
    Y = zad2(X,Z,m);
    h = 0.45;
    [m_est, x] = zad3(X,Y,N,K,h);
    figure
    hold on;
    plot(x, m_est);
    plot(range, m(a .* range));
    xlabel('x');
    ylabel('m(x)');
    title(sprintf('%s, a=%g', t, a))
    grid on; grid minor;
end


function [m_est] = estymator(x, X, Y, h, K)
    m_est = nan(size(x));
    for i = 1 : length(x)
        a = (X - x(i)) / h;
        k = K(a);
        s1 = sum(sum(Y.*k));
        s2 = sum(sum(k));
        m_est(i) = s1 / s2;
    end
end
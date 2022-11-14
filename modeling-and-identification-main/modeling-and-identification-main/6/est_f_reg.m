function [m] = est_f_reg(x, Y, X, h, K)
    m = nan(size(x));
    for i = 1 : length(X)
        a = (X - x(i)) / h;
        k = K(a);
        s1 = sum(sum(Y.*k));
        s2 = sum(sum(k));
        m(i) = s1 / s2;
    end
end


function [valid_h, h_N, errorH] = zad5(m, K, Y, X)
    Q = 100;
    q = -Q : 1 : Q;
    h_N = 0.01: 0.01: 3;
    errorH = zeros(size(q));
    for i = 1 : length(h_N)
        m_est = estymator(q/Q, X, Y, h_N(i), K);
        m_q = m(q / Q);
        errorH(i) = sumsqr(m_est - m_q) / (2 * Q);
    end
    errorH = errorH(1:length(h_N));
    valid_h = h_N(errorH == min(errorH));
end


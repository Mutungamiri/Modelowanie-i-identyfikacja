function [X] = gen_rozk_norm(N)
    i = 1;
    X = 1 : N;
    c = sqrt(2 * exp(1) / pi);
    while i <= N
        U1 = rand;
        U2 = rand;
        if U2 <= 1/2
            V = log(2 * U2);
        else
            V = -log(-2 * (U2 - 1));
        end
        if U1 * c * 1/2 * exp(-abs(V)) <= 1 / sqrt(2 * pi) * exp(-V^2 / 2)
            X(i) = V;
            i = i + 1;
        end
    end
end


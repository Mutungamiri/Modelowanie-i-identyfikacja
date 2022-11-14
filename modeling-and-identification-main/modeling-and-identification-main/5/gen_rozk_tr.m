function [X] = gen_rozk_tr(N, a, b, d)
    % Generator rozkladu trojkatnego
    X = zeros(N, 1);
    i = 1;
    while i <= N
        U1 = rand;
        U2 = rand;
        U1 = U1 * abs(a - b) + min(a, b);
        U2 = U2 * d;
        if U1 >= -1 && U1 <= 0
            if U2 <= U1 + 1
                X(i) = U1;
                i = i+1;
            end
        else
            if U2 <= -1 * U1 + 1
                X(i) = U1;
                i = i+1;
            end
        end
    end
end

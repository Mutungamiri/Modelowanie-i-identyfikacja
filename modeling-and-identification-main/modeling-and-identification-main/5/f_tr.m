function [f] = f_tr(x)
    f = zeros(size(x));
    for i = 1 : length(x)
        if x(i) > -1 && x(i) <= 0
            f(i) = x(i) + 1;
        end
        if x(i) > 0 && x(i) <= 1
            f(i) = -x(i) + 1;
        end
    end
end


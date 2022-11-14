function [f] = f_jedn(x)
    f = zeros(length(x), 1);
    for i = 1 : length(x)
        if x(i) >= 0 && x(i) <= 1
            f(i) = 1;
        end
    end
end


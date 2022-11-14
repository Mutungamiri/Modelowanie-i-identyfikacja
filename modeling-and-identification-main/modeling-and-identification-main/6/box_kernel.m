function [X] = box_kernel(x)
    X = zeros(size(x));
    for i = 1:size(x)
        if x(i) > -1 && x(i) < 1
            X(i) = 1;
        else
            X(i) = 0;
        end
    end
end


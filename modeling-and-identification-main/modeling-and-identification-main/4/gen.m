function [X] = gen(N)
    X = rand(N, 1);
    for i=1:length(X)
        if X(i) >= 0 && X(i) <= 1
            X(i) = sqrt(X(i));
        else
            X(i) = 0;
        end
    end
end


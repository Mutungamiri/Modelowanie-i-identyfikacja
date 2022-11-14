function [X] = generator(n,m)

z = 3;
x0 = 0.8;
X = zeros(n,m);
X(1,1) = x0;

for n1 = 1:n-1
    for m1 = 1:(m-1)
        X(n1,m1+1) = X(n1,m1)*z - floor(X(n1,m1)*z);
        X(n1+1,m1) = X(n1,m1)*z - floor(X(n1,m1)*z);
        X(n1+1,m1+1) = X(n1,m1)*z - floor(X(n1,m1)*z);
        X(n1,m1+1) = round(X(n1,m1+1), 4);
        X(n1+1,m1) = round(X(n1+1,m1), 4);
        X(n1+1,m1+1) = round(X(n1+1,m1+1), 4);
    end
end
end
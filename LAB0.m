clear all

n = 100;
z = 3;
x0 = 0.8;
X = zeros(1,n);
X(1) = x0;

for n = 1:n
    X(n+1) = X(n)*z - floor(X(n)*z);
    X(n+1) = round(X(n+1),4);
end

ox = 0:n;

%histogram(X);
%scatter(ox, X, 'filled')
%plot(X);

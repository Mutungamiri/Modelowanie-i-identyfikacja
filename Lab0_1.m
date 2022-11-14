clear all

n = 1000;
c = 3;
m = 127;
a = 5;
X(1) = 0.27;


for i = 2:n
    
    X(i) = (mod(a*X(i-1)+c,m));
    
end

X = X./m;

ox = 1:n;

histogram(X)
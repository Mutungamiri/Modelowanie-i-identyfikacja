function x = rand_m01(ilosc)
x = 1:ilosc;
x(1) = 0.73;
z = 21;
for i=2:ilosc
    x(i) = x(i-1)*z - floor(x(i-1)*z);
end
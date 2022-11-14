% Implementationn of Rejection method
% Mohammad Ismail Hossain 
% Jacobs University Bremen
clc;
clear all;close all;
a=-4;
b=4;
ymax=0.4;
q=0;
for p=1:1000
  
    u1=rand(1,1);
    u2=rand(1,1);
    x1=a+u1*(b-a);
    y1=ymax*u2;
    f=(exp(-x1^2/2))/(sqrt(2*pi));
    
    while 1 && q<20
        if y1<=f
            
            x=x1;
            scatter(x,f);
            hold on;
        end
        q=q+1;
    end
    q=0;
end
xlabel('Number of Distribution (x)','fontsize',14);
ylabel('Probability Density Function (F(x))','fontsize',14);
title('Rejection Method for Normal Distribution','fontsize',14);
grid on;
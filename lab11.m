close all;
clear;

% Zadanie 1, 2
%
N = 10;
a = 0.3;
b = 2;
U = zeros(N,1);
U(1) = 10;
Y = zeros(N,1);
Y(1) = b*U(1);
for i = 2:N
    Y(i) = b*U(i) + a*Y(i-1);
end
figure()
plot(1:N,Y,'r')
grid on; grid minor;
%}

% Zadanie 3, 4
%{
N = 100;
a = 0.3;
b = 2;
U = rand(N+1,1);
c = 1;
e = rand(N+1,1)*2*c - c;        %???? jak zrobić biały szum jednostajny
V = zeros(N+1,1);
Y_pomoc = zeros(N+1,1);
V(1) = b*U(1);
Y_pomoc(1) = V(1) + e(1);
for i = 2:N+1
    V(i) = b*U(i) + a*V(i-1);
    Y_pomoc(i) = V(i) + e(i);
end
fi = [U(2:N+1),Y_pomoc(1:N)];
%Y = (Y_pomoc(2:N+1));
Z = zeros(N,1);
for i = 1:N
    Z(i) = e(i+1) - a*e(i);
end
theta = [b; a];
Y = fi*theta + Z;
theta_est = (fi'*fi)^(-1)*fi'*Y;
%}

% Zadanie 5
%{
N_wekt = 20:2:300;
[cos,ilosc] = size(N_wekt);
a = 0.3;
b = 2;
theta = [b; a];
L = 200;
c = 1;
blad = zeros(1,ilosc);
for j = 1:ilosc
    N = N_wekt(j);
    U = rand(N+1,1);
    for i = 1:L
        e = rand(N+1,1)*2*c - c;        %???? jak zrobić biały szum jednostajny
        V = zeros(N+1,1);
        Y_pomoc = zeros(N+1,1);
        V(1) = b*U(1);
        Y_pomoc(1) = V(1) + e(1);
        for k = 2:N+1
            V(k) = b*U(k) + a*V(k-1);
            Y_pomoc(k) = V(k) + e(k);
        end
        fi = [U(2:N+1),Y_pomoc(1:N)];
        Z = zeros(N,1);
        for k = 1:N
            Z(k) = e(k+1) - a*e(k);
        end
        Y = fi*theta + Z;
        theta_est = (fi'*fi)^(-1)*fi'*Y;
        blad(j) = blad(j) + norm(theta_est-theta,2)^2;
    end
    blad(j) = blad(j)/L;
end
figure()
hold on;
plot(N_wekt,blad);
title("Bład estymatora");
xlabel("N");
ylabel("Err theta_{est}");
%}

% Zadanie 6, 7, 8
%{
N = 100;
a = 0.3;
b = 2;
U = rand(N+1,1);
c = 5;
e = rand(N+1,1)*2*c - c;        %???? jak zrobić biały szum jednostajny
V = zeros(N+1,1);
Y_pomoc = zeros(N+1,1);
V(1) = b*U(1);
Y_pomoc(1) = V(1) + e(1);
for i = 2:N+1
    V(i) = b*U(i) + a*V(i-1);
    Y_pomoc(i) = V(i) + e(i);
end
fi = [U(2:N+1),Y_pomoc(1:N)];
Z = zeros(N,1);
for i = 1:N
    Z(i) = e(i+1) - a*e(i);
end
theta = [b; a];
Y = fi*theta + Z;
theta_est = (fi'*fi)^(-1)*fi'*Y;

V_niezasz = zeros(N,1);
V_niezasz(1) = theta_est(1)*U(1);
for i = 2:N
    V_niezasz(i) = theta_est(1)*U(i) + theta_est(2)*V_niezasz(i-1);
end
psi = [U(2:N+1),V_niezasz];
theta_estIV = (psi'*psi)^(-1)*psi'*Y;
%}

% Zadanie 9
%{
N_wekt = 20:2:400;
[cos,ilosc] = size(N_wekt);
a = 0.3;
b = 2;
theta = [b; a];
L = 200;
c = 3;
blad = zeros(1,ilosc);
blad_IV = zeros(1,ilosc);
for j = 1:ilosc
    N = N_wekt(j);
    U = rand(N+1,1);
    for i = 1:L
        e = rand(N+1,1)*2*c - c;        %???? jak zrobić biały szum jednostajny
        V = zeros(N+1,1);
        Y_pomoc = zeros(N+1,1);
        V(1) = b*U(1);
        Y_pomoc(1) = V(1) + e(1);
        for k = 2:N+1
            V(k) = b*U(k) + a*V(k-1);
            Y_pomoc(k) = V(k) + e(k);
        end
        fi = [U(2:N+1),Y_pomoc(1:N)];
        Z = zeros(N,1);
        for k = 1:N
            Z(k) = e(k+1) - a*e(k);
        end
        Y = fi*theta + Z;
        theta_est = (fi'*fi)^(-1)*fi'*Y;
        V_niezasz = zeros(N,1);
        V_niezasz(1) = theta_est(1)*U(1);
        for k = 2:N
            V_niezasz(k) = theta_est(1)*U(k) + theta_est(2)*V_niezasz(k-1);
        end
        psi = [U(2:N+1),V_niezasz];
        theta_estIV = (psi'*psi)^(-1)*psi'*Y;
        blad(j) = blad(j) + norm(theta_est-theta,2)^2;
        blad_IV(j) = blad_IV(j) + norm(theta_estIV-theta,2)^2;
    end
    blad(j) = blad(j)/L;
    blad_IV(j) = blad_IV(j)/L;
end
figure()
hold on;
plot(N_wekt,blad);
plot(N_wekt,blad_IV);
legend('MNK','IV')
title("Bład estymatora");
xlabel("N");
ylabel("Err theta_{est}");
%}







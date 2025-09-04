clear
close all
clc

x=[0 2 2 0 1 1 0 2 2 0 1 1];
n=[0 1 2 3 4 5 6 7 8 9 10 11];

subplot(2,3,1)
stem(n,x,'LineWidth',2);
grid on;
axis([0 12 0 2.5]);
xlabel('n');
ylabel('x[n]');
title ('señal x[n]');


syms ks
Xk = 2*exp(-2*1i*pi*ks/7) + 2*exp(-2*1i*pi*ks/7) + exp(-2*1i*pi*ks*4/7) + 1*exp(-2*1i*pi*ks*5/7);

k = -10:0.2:10;
Xk_vals = double(subs(Xk, ks, k));

subplot(2,3,2)
plot(k, Xk_vals, 'LineWidth', 2);
grid on;
axis([-10 10 -1 6.5]);
xlabel('k');
ylabel('X(k)');
title ('Transformada X(k)');
% Definir las señales
clear
clc;
close all;

n=-10:1:10;



u=double(n>0); % Escalón unitario
x=(2/3).^n.*u; % Señal exponencial
h=(2/3).^n.*u; % Respuesta al impulso

y=conv(x,h,"same"); % Convolución

stem(n,y,'LineWidth',2); % Graficar x[n]
grid on;
title('Convolución de x[n] y h[n]');
axis([0 11 0 1]);
xlabel('n');
ylabel('y[n]');
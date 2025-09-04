clc; 
clear;


u = @(t) (t >= 0); 
% Definir Parámetros

t = -2:0.01:6;

y = t.*(u(t)-u(t-1)) + 1.*(sin(pi/2*t+pi/2)+1).*(u(t-1)-u(t-3)) + 1.*(u(t-3)-u(t-4)) + (-t+5).*(u(t-4)-u(t-5));
f = y(:); % Convierte y en un vector columna


hold on
plot(t, y, 'b', 'linewidth', 4);
title('Función aproximada');
xlabel('Intervalo');
ylabel('Amplitud');
grid on;
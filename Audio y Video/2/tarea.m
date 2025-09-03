clc; 
clear;


u = @(t) (t >= 0); 
% Definir Parámetros

t = -2:0.01:6;


y = t.*(u(t)-u(t-1))+1.*(sin(pi/2*t+pi/2)+1).*(u(t-1)-u(t-3))+1.*(u(t-3)-u(t-4))+(-t+5).*(u(t-4)-u(t-5));

cantidad_de_terminos = 50;

acumulador = 0;

a0 = 1/5.*(int(y, t, 0, 5));
an = 1/5.*(int(y, t, 0, 5)*cos((n*pi*1/5)*t));
bn = 1/5.*(int(y, t, 0, 5)*sin((n*pi*1/5)*t));

fx = a0/2 + sum(an*cos((n*pi*1/5)*t) + bn*sin((n*pi*1/5)*t), n, 1, cantidad_de_terminos);

% Graficar Funciones
hold on

% Función Aproximada
plot(t, fx, 'r', 'linewidth', 4);

% Función Original
plot(t, y, 'b', 'linewidth', 4);
title('Función aproximada');
xlabel('Intervalo');
ylabel('Amplitud');
grid on;
clear;
close all;
clc;

% Definir la función escalón unitario
u = @(t) (t >= 0); 

% Rango de tiempo
t = 0:0.1:10; 

% Definir la función por partes
y = 2.*(sin(2*pi*t)).*(u(t)-u(t-10)); % Oscilación senoidal entre t = 2 y t = 3

% Graficar la función
plot(t, y, 'r', 'LineWidth', 2);
axis([0 10 -2 2]); % Límites de los ejes
grid on;
xlabel('Tiempo (t)');
ylabel('y(t)');
title('Gráfica de la función definida por partes');
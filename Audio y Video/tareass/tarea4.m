clc; clear;

% Tu señal original
u = @(t) (t >= 0);
t = -2:0.01:6;
y = t.*(u(t)-u(t-1)) + 1.*(sin(pi/2*t+pi/2)+1).*(u(t-1)-u(t-3)) + 1.*(u(t-3)-u(t-4)) + (-t+5).*(u(t-4)-u(t-5));

% Definir una segunda señal (ejemplo: pulso rectangular)
h = (u(t-0.5) - u(t-1.5)); % Pulso de 1 segundo de duración

% Convolución
convolucion = conv(y, h, 'same') * 0.01; % Factor de escala por el dt

% Visualización
figure;
subplot(3,1,1);
plot(t, y, 'b', 'linewidth', 2);
title('Señal original y(t)');
xlabel('Tiempo');
ylabel('Amplitud');
grid on;

subplot(3,1,2);
plot(t, h, 'r', 'linewidth', 2);
title('Señal h(t)');
xlabel('Tiempo');
ylabel('Amplitud');
grid on;

subplot(3,1,3);
plot(t, convolucion, 'g', 'linewidth', 2);
title('Convolución y(t) * h(t)');
xlabel('Tiempo');
ylabel('Amplitud');
grid on;

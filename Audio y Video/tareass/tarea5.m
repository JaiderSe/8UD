clc; clear;

% Definir escalón unitario
u = @(t) (t >= 0);

% Definir el vector de tiempo
t = -2:0.01:6;
dt = 0.01;

% Tu señal original
y = t.*(u(t)-u(t-1)) + 1.*(sin(pi/2*t+pi/2)+1).*(u(t-1)-u(t-3)) + 1.*(u(t-3)-u(t-4)) + (-t+5).*(u(t-4)-u(t-5));

% Definir la segunda señal (respuesta al impulso)
h = (u(t-0.5) - u(t-1.5)); % Pulso rectangular

% Calcular la convolución completa para referencia
convolucion_completa = conv(y, h, 'same') * dt;

% Preparar la animación
figure('Position', [100, 100, 1200, 800]);

% Definir los pasos de la animación
pasos = 1:50:length(t); % Cada 50 puntos para que no sea muy lenta

for i = 1:length(pasos)
    n = pasos(i);
    tau_actual = t(n);
    
    clf; % Limpiar la figura
    
    % Subplot 1: Señal original y(t)
    subplot(3,1,1);
    plot(t, y, 'b-', 'LineWidth', 2);
    hold on;
    plot(tau_actual, y(n), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
    title(['Señal original y(t) - t = ', num2str(tau_actual, '%.2f')]);
    xlabel('Tiempo (t)');
    ylabel('Amplitud');
    grid on;
    xlim([-2, 6]);
    ylim([min(y)-0.5, max(y)+0.5]);
    
    % Subplot 2: Señal h(t) desplazada y reflejada
    subplot(3,1,2);
    % Crear h(tau - t) = h reflejada y desplazada
    h_reflejada = zeros(size(t));
    for j = 1:length(t)
        tau = t(j);
        % Buscar el índice correspondiente a (tau_actual - tau)
        idx = round((tau_actual - tau + 2) / dt) + 1;
        if idx >= 1 && idx <= length(h)
            h_reflejada(j) = h(idx);
        end
    end
    
    plot(t, h_reflejada, 'r-', 'LineWidth', 2);
    hold on;
    plot(tau_actual, 0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
    title(['h(τ-t) reflejada y desplazada - τ = ', num2str(tau_actual, '%.2f')]);
    xlabel('Tiempo (t)');
    ylabel('Amplitud');
    grid on;
    xlim([-2, 6]);
    ylim([min(h)-0.1, max(h)+0.1]);
    
    % Subplot 3: Producto y(t) * h(τ-t) y resultado parcial
    subplot(3,1,3);
    producto = y .* h_reflejada;
    plot(t, producto, 'g-', 'LineWidth', 2);
    hold on;
    
    % Calcular la integral (suma) hasta el punto actual
    if n > 1
        integral_parcial = sum(producto(1:n)) * dt;
        plot(tau_actual, integral_parcial, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');
    end
    
    % Mostrar también la convolución completa para comparación
    plot(t, convolucion_completa, 'k--', 'LineWidth', 1);
    
    title(['Producto y(t)·h(τ-t) y resultado parcial: y(τ) = ', num2str(sum(producto(1:n)) * dt, '%.3f')]);
    xlabel('Tiempo (t)');
    ylabel('Amplitud');
    grid on;
    xlim([-2, 6]);
    ylim([min([producto, convolucion_completa])-0.5, max([producto, convolucion_completa])+0.5]);
    legend('Producto', 'Resultado parcial', 'Convolución completa', 'Location', 'best');
    
    % Pausa para la animación
    pause(0.1);
end

% Mostrar la convolución final
figure;
subplot(2,1,1);
plot(t, y, 'b-', 'LineWidth', 2);
title('Señal original y(t)');
xlabel('Tiempo');
ylabel('Amplitud');
grid on;

subplot(2,1,2);
plot(t, h, 'r-', 'LineWidth', 2);
title('Respuesta al impulso h(t)');
xlabel('Tiempo');
ylabel('Amplitud');
grid on;

figure;
plot(t, convolucion_completa, 'g-', 'LineWidth', 2);
title('Convolución final y(t) * h(t)');
xlabel('Tiempo');
ylabel('Amplitud');
grid on;

% Animación de la convolución de dos señales en MATLAB

% Señales de ejemplo
x = [0 1 2 1 0 0 1];
h = [1 0.5 0];

N = length(x);
M = length(h);
y = conv(x, h,"same");

figure;





for n = 1:7
    
    clf;

    


    % Señal x
    subplot(3,1,1);
    stem(0:N-1, x, 'filled');
    title('Señal x[n]');
    ylim([0 max(x)+1]);
    
    % Señal h desplazada
    subplot(3,1,2);
    h_shift = zeros(1, N+M-1);
    idx_start = n;
    idx_end = min(n+M-1, N+M-1); % Asegura que el índice no exceda el tamaño
    h_shift(idx_start:idx_end) = h(1:idx_end-idx_start+1);
    stem(0:N+M-2, h_shift, 'r', 'filled');
    title(['h[n] desplazada a n = ', num2str(n-1)]);
    ylim([0 max(h)+1]);
    

    
    % Producto y suma parcial
    subplot(3,1,3);
    prod = x .* fliplr(h_shift(1:N));
    stem(0:N-1, prod, 'g', 'filled');
    hold on;
    stem(n-1, y(n), 'k', 'filled', 'LineWidth',2);
    title(['Producto y suma parcial: y[', num2str(n-1), '] = ', num2str(y(n))]);
    ylim([0 max(y)+1]);
    
    pause(0.7);
    
end


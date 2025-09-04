x = [0,2,2,0,1,1,0,2,2,0,1,1];
n = [0,1,2,3,4,5,6,7,8,9,10,11];

% Transformada de Fourier Discreta
X = fft(x);

% Transformada Inversa de Fourier
x_recuperada = ifft(X);

% Graficar señal original
subplot(3,1,1);
stem(n, x, 'filled');
grid on;
title('Señal original');
xlabel('n');
ylabel('x[n]');

% Graficar magnitud de la transformada
subplot(3,1,2);
plot(n, abs(X), 'LineWidth', 2);
title('Magnitud de la Transformada de Fourier');
xlabel('k');
ylabel('|X[k]|');

% Graficar señal recuperada
subplot(3,1,3);
stem(n, real(x_recuperada), 'filled');
title('Señal recuperada (parte real)');
xlabel('n');
ylabel('x_{recuperada}[n]');
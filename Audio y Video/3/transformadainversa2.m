% Ejemplo de transformada de Fourier y su inversa en MATLAB

% Definir el dominio temporal
t = linspace(-5, 5, 1000);
% Definir la función original (por ejemplo, una gaussiana)
f = exp(-t.^2);

% Calcular la transformada de Fourier
F = fftshift(fft(f));
% Definir el dominio de frecuencias
dt = t(2) - t(1);
N = length(t);
frec = (-N/2:N/2-1)/(N*dt);

% Calcular la transformada inversa
f_recuperada = ifft(ifftshift(F));

% Graficar la función original
subplot(3,1,1);
plot(t, f);
title('Función original');
xlabel('t');
ylabel('f(t)');

% Graficar la transformada de Fourier (magnitud)
subplot(3,1,2);
plot(frec, abs(F));
title('Transformada de Fourier (magnitud)');
xlabel('Frecuencia');
ylabel('|F(\omega)|');

% Graficar la función recuperada
subplot(3,1,3);
plot(t, real(f_recuperada));
title('Función recuperada (inversa)');
xlabel('t');
ylabel('f_{recuperada}(t)');
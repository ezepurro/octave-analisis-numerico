clear;
close all;
clc;

% Constantes
N = 4096;
dt = 0.0001;
Fc = 500;

% Funcion X

Nx = 401;
nx = 0:Nx-1;

t  = nx * dt;
x = 10*cos(2*pi*150*t) + 5*sin(2*pi*1000*t);

% Funcion Respuesta al Impulso

Nh = 101;
nh = -(Nh-1)/2 : (Nh-1)/2;
h = 2*Fc*dt * sinc(2*Fc*dt*nh);

% Transformadas

a = zeros(1, N-Nx);
b = zeros(1, N-Nh);

xa = [x, a];
hb = [h, b];
nxa = 0:N-1;
nhb = nh(1) : nh(1)+N-1;
kx = 0:N-1;
kh = 0:N-1;

xf = fft(xa);
hf = fft(hb);


% Funcion Y

yf = xf .* hf;
ky = 0:N-1;

ny = (nx(1) + nh(1)) : (nx(end) + nh(end));

y_fft_completa = real(ifft(yf));

y_fft = y_fft_completa(1:length(ny));

% Graficos
figure('Name', 'Ejercicio 3 - Convolucion por FFT', 'NumberTitle', 'off');

subplot(3,2,1)
stem(nxa, xa);
title('Señal de entrada x[n]')
xlabel('n')
ylabel('Amplitud')
xlim([ny(1), ny(end)])

subplot(3,2,2)
stem(kx,abs(xf))
title('Espectro de la entrada |X[k]|')
xlabel('k')
ylabel('Amplitud')
xlim([0,500])

subplot(3,2,3)
stem(nhb,hb)
title('Respuesta al impulso h[n]')
xlabel('n')
ylabel('Amplitud')
xlim([ny(1), ny(end)])

subplot(3,2,4)
stem(kh,abs(hf));
title('Respuesta en frecuencia |H[k]| (pasa bajos)')
xlabel('k')
ylabel('Amplitud')
xlim([0,500])

subplot(3,2,5)
stem(ny,y_fft);
title('Salida y[n] = IFFT\{X[k]·H[k]\}')
xlabel('n')
ylabel('Amplitud')
xlim([ny(1), ny(end)])

subplot(3,2,6)
stem(ky,abs(yf));
title('Espectro de la salida |Y[k]| = |X[k]·H[k]|')
xlabel('k')
ylabel('Amplitud')
xlim([0,500])

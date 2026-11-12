clear;
close all;
clc;

Nx = 401;
dt = 0.0001;
n  = 0:Nx-1;
t  = n * dt;

x = 10*cos(2*pi*150*t) + 5*sin(2*pi*1000*t);

Fc = 500;

Nh = 101;
nh = -(Nh-1)/2 : (Nh-1)/2;
h = 2*Fc*dt * sinc(2*Fc*dt*nh);

ny_inicio = n(1)   + nh(1);   % 0 + (-50)  = -50
ny_fin    = n(end) + nh(end); % 400 + 50   = 450
ny        = ny_inicio:ny_fin; % 501 elementos, igual que y

y = conv(x,h);

figure;
subplot(3,1,1)

stem(t,x)

subplot(3,1,2)

stem(nh,h)

subplot(3,1,3)

stem(ny, y)

clear;
close all;
clc;

nx = -5:5;
x  = ones(1, length(nx));

nh = 0:5
h = nh

ny_inicio = nx(1)   + nh(1);
ny_fin    = nx(end) + nh(end);
ny        = ny_inicio:ny_fin;

y = conv(x,h)

subplot(3,1,1)
stem(nx,x)
xlim([-6,16])

subplot(3,1,2)

stem(nh,h)
xlim([-6,16])

subplot(3,1,3)

stem(ny, y)
xlim([-6,16])

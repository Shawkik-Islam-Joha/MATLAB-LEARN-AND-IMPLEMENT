clc;
clear;
close all;

n = -10:10;
f = 1;

x1 = (n == 0);
x2 = (n >= 0);
x3 = n .* (n >= 0);
x4 = 0.5 * sin(2*pi*f*n);

figure;

subplot(3,2,1);
stem(n,x1);
grid on;
xlabel('n');
ylabel('\delta[n]');
title('Unit Impulse Signal');

subplot(3,2,2);
stem(n,x2);
grid on;
xlabel('n');
ylabel('u[n]');
title('Unit Step Signal');

subplot(3,2,3);
stem(n,x3);
grid on;
xlabel('n');
ylabel('r[n]');
title('Unit Ramp');

subplot(3,2,4);
stem(n,x4);
grid on;
xlabel('n');
ylabel('x[n]');
title('Sinusoidal');

b = [0.5 1.5];
a = [1 1];

h = filter(b,a,x1);
s = filter(b,a,x2);

subplot(3,2,5);
stem(n,h);
grid on;
xlabel('n');
ylabel('h[n]');
title('Impulse Response');

subplot(3,2,6);
stem(n,s);
grid on;
xlabel('n');
ylabel('y[n]');
title('Step Response');


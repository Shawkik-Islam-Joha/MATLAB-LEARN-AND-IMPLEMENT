clc;
clear;
close all;

n = 0:100;                    
x = (n>=1);           

b = 2;                       
a = [1 -1]; 
y = filter(b, a, x);    
syms z n;
figure;

subplot(2,1,1);
stem(n, x, 'filled');
grid on;
xlabel('n');
ylabel('x(n)');
title('Input');

subplot(2,1,2);
stem(n, y, 'filled');
grid on;
xlabel('n');
ylabel('y(n)');
title('Output');

zplane(b,a);
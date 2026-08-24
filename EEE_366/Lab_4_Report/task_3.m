clc;
clear;
close all;

numerator = [1, 0, -4];
denominator = [1, -1.8, 0.8];

figure;
zplane(numerator, denominator);
title('Pole-Zero Plot');
grid on;

[Z, P, K] = tf2zp(numerator, denominator);

disp('Poles:');
disp(P);

disp('Zeros:');
disp(Z);

disp('Gain:');
disp(K);
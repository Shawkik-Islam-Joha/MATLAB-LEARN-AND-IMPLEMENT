clc;
clear;
close all;

numerator1 = [1, 2, 5];
numerator2 = [1, -3, 4];

result_numerator = conv(numerator1, numerator2);

disp('The resulting numerator coefficients after convolution are:');
disp(result_numerator);
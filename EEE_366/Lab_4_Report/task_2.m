clc;
clear;
close all;

numerator = [1, -4, 6];
denominator = [1, -3, 2];

[R, P, C] = residuez(numerator, denominator);

disp('Residues:');
disp(R);

disp('Poles:');
disp(P);

disp('Direct Terms:');
disp(C);

syms z n;
Xz = poly2sym(numerator, z) / poly2sym(denominator, z);

x_n = iztrans(Xz, z, n);

disp('The inverse Z-transform (time-domain signal) is:');
disp(x_n);
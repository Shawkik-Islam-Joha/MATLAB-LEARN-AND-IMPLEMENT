clc;
clear;
close all;

b = 1;
a = [1 0.6];
n = -10:20;
x_imp = (n == 0);
h = filter(b, a, x_imp);

x_step = (n >= 0);
y_step = filter(b, a, x_step);
x_sin = 0.5*sin(n).*(n >= 0);
y_sin = filter(b, a, x_sin);

figure;
subplot(3,2,1);
stem(n, x_imp, 'filled');
grid on;
xlabel('n');
ylabel('x(n)');
title('Impulse Input');

subplot(3,2,2);
stem(n, h, 'filled');
grid on;
xlabel('n');
ylabel('h(n)');
title('Impulse Response');

subplot(3,2,3);
stem(n, x_step, 'filled');
grid on;
xlabel('n');
ylabel('x(n)');
title('Step Input');

subplot(3,2,4);
stem(n, y_step, 'filled');
grid on;
xlabel('n');
ylabel('y(n)');
title('Step Response');

subplot(3,2,5);
stem(n, x_sin, 'filled');
grid on;
xlabel('n');
ylabel('x(n)');
title('Sinusoidal Input');

subplot(3,2,6);
stem(n, y_sin, 'filled');
grid on;
xlabel('n');
ylabel('y(n)');
title('Sinusoidal Response');

n_c = 0:20;
x_step_c = ones(1,length(n_c));
h_c = filter(b, a, [1 zeros(1,length(n_c)-1)]);

y_step_conv = conv(x_step_c, h_c);
n_step_conv = 0:length(y_step_conv)-1;
y_step_filter = filter(b, a, x_step_c);

x_sin_c = 0.5*sin(n_c);
y_sin_conv = conv(x_sin_c, h_c);
n_sin_conv = 0:length(y_sin_conv)-1;
y_sin_filter = filter(b, a, x_sin_c);

figure;
subplot(2,2,1);
stem(n_step_conv, y_step_conv, 'filled');
grid on;
xlabel('n');
ylabel('y(n)');
title('Step Response Using conv()');

subplot(2,2,2);
stem(n_c, y_step_filter, 'filled');
grid on;
xlabel('n');
ylabel('y(n)');
title('Step Response Using filter()');

subplot(2,2,3);
stem(n_sin_conv, y_sin_conv, 'filled');
grid on;
xlabel('n');
ylabel('y(n)');
title('Sinusoidal Response Using conv()');

subplot(2,2,4);
stem(n_c, y_sin_filter, 'filled');
grid on;
xlabel('n');
ylabel('y(n)');
title('Sinusoidal Response Using filter()');

step_error = max(abs(y_step_conv(1:length(y_step_filter)) - y_step_filter));
sin_error = max(abs(y_sin_conv(1:length(y_sin_filter)) - y_sin_filter));

fprintf('Maximum step-response verification error = %g\n', step_error);
fprintf('Maximum sinusoidal-response verification error = %g\n', sin_error);
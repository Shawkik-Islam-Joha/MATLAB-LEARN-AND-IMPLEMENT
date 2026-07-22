n = -20:20;

b = [0.5 1.5];
a = [1 1];

x1 = [zeros(1,20) 1 zeros(1,20)];
x2 = [zeros(1,20) ones(1,21)];

h = filter(b,a,x1);
s = filter(b,a,x2);

subplot(2,1,1)
stem(n,h,'filled')
grid on
title('Impulse Response')
xlabel('n')
ylabel('h[n]')

subplot(2,1,2)
stem(n,s,'filled')
grid on
title('Step Response')
xlabel('n')
ylabel('y[n]')
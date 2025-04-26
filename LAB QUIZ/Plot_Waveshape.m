t = 0:0.0001:0.03;
T = 0.01;
f = 1/T;
v = 10*sin(2*pi*f*t);
plot(t,v,'g-','LineWidth',2);
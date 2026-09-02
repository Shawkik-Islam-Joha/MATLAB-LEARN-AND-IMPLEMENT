% Source code written by - SHAWKIK ISLAM JOHA, ID: 2202124
x = 100*124;
n = 1:3*x;
y = [zeros(1,x),ones(1,x),zeros(1,x)];
noise = rand(size(y));
z = y + noise;

figure;
subplot(3,1,1);
plot(n,y);
title("Defined Signal");
xlabel("Sample Number");
ylabel("Amplitude");
grid on;
subplot(3,1,2);
plot(n,noise);
title("Noise Signal");
xlabel("Sample Number");
ylabel("Amplitude");
subplot(3,1,3);
plot(n,z);
title("Noise Injected Signal");
xlabel("Sample Number");
ylabel("Amplitude");
grid on;

window = 200;
b = (1/window)*ones(1,window);
a = 1;
filtered_z = filter(b,a,z);

figure;
subplot(3,1,1);
plot(n,filtered_z);
title("Filtered Signal for Moving Average of window = 200");
xlabel("Sample Number");
ylabel("Amplitude");
grid on;

window = 1000;
b = (1/window)*ones(1,window);
filtered_z = filter(b,a,z);
subplot(3,1,2);
plot(n,filtered_z);
title("Filtered Signal for Moving Average of window = 1000");
xlabel("Sample Number");
ylabel("Amplitude");
grid on;

window = 10000;
b = (1/window)*ones(1,window);
filtered_z = filter(b,a,z);
subplot(3,1,3);
plot(n,filtered_z);
title("Filtered Signal for Moving Average of window = 10000");
xlabel("Sample Number");
ylabel("Amplitude");
grid on;





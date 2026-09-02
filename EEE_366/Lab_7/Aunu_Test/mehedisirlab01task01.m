% Moving Average Filter
x = 100*(130);
y = [zeros(1,x) ones(1,x) zeros(1,x)];
n = 1:length(y);
figure;
plot(n,y);
title('Original Signal');
% Random Noise
noise = rand(size(n));
z = y + noise;
figure;
plot(n,z);
title('Noisy Signal in Time Domain');
% Moving Average Filter with Window Size 100
windowSize = 100;
b = (1/windowSize)*ones(1,windowSize);
a = 1;
z_filtd = filter(b,a,z);
figure;
plot(n,z_filtd);
title('Filtered Signal with Window Size 100');
% Moving Average Filter with Window Size 500
windowSize = 500;
b = (1/windowSize)*ones(1,windowSize);
a = 1;
z_filtd = filter(b,a,z);
figure;
plot(n,z_filtd);
title('Filtered Signal with Window Size 500');
% Moving Average Filter with Window Size 1000
windowSize = 1000;
b = (1/windowSize)*ones(1,windowSize);
a = 1;
z_filtd = filter(b,a,z);
figure;
plot(n,z_filtd);
title('Filtered Signal with Window Size 1000');
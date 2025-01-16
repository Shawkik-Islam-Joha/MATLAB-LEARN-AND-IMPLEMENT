%To implement ohm's law formula,we need a resistor R and voltage V across
%it
R1 = 10;
R2 = 20;
R3 = 40;
%Taking a vector V contaning values of V
V = 1:0.5:100;   %V ranges is from 1 to 100 with 0.5 V interval
I1 = V/R1;
I2 = V/R2;
I3 = V/R3;
%plotting the subplot of V vs I.
subplot(3,2,1);
plot(I1,V,"r");
title("V vs I1");
ylabel("Voltage V");
xlabel("Current(I1)");
grid on;

subplot(3,2,4);
plot(I2,V,"g");
title("V vs I2");
ylabel("Voltage V");
xlabel("Current(I2)");
grid on;

subplot(3,2,5);
plot(I1,V,"b");
title("V vs I3");
ylabel("Voltage V");
xlabel("Current(I3)");
grid on;


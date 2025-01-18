%To implement ohm's law formula,we need a resistor R and voltage V across
%it
R1 = 10;
R2 = 20;
R3 = 40;
%Taking a vector V contaning values of V
V = 1:0.5:100;   %Range of V is from 1 to 100 with 0.5 V interval
I1 = V/R1;
I2 = V/R2;
I3 = V/R3;
%plotting the subplot of V vs I.
subplot(3,2,1);
plot(V,I1,"r");
title("I1 vs V");
xlabel("Voltage V");
ylabel("Current(I1)");
grid on;

subplot(3,2,4);
plot(V,I2,"g");
title("I2 vs V");
xlabel("Voltage V");
ylabel("Current(I2)");
grid on;

subplot(3,2,5);
plot(V,I3,"b");
title("I3 vs V");
xlabel("Voltage V");
ylabel("Current(I3)");
grid on;

%saveas(gcf, 'Fig2.png');


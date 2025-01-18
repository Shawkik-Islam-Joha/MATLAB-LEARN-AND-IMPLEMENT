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
%plotting the graph V vs I, Green line.
plot(V,I1,"r",V,I2,"g",V,I3,"b")
grid on;
%modifying the plot.
title("I vs V")
xlabel("Voltage(V)")
ylabel("Current(I)")
%saveas(gcf, 'Fig1.png');
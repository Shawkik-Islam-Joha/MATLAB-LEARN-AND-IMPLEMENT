%To implement ohm's law formula,we need a resistor R and voltage V across
%it
R = 15;
%Taking a vector V contaning values of V
V = 1:0.5:100;   %V ranges is from 1 to 100 with 0.5 V interval
I = V/R;
%plotting the graph V vs I, Green line.
plot(I,V,"g")
grid on;

title("V vs I")
ylabel("Voltage(V)")
xlabel("Current(I)")

%The circuit is given where V1 is variable source voltage and we have to
%find out the voltage across resistor R4 for that.
%Here,
R1 = 10;
R2 = 10;
R3 = 5;
R4 = 20;
Vin = 0:100;    % Vin ranges from 0 to 100 with unity interval
V2 = 10;
%Writing the eqn of Mesh 1,
%20*I1 - 10*I2 = Vin - 10;

%Writing the eqn of Mesh 2,
%10*I1 - 35*I2 = -10;

%Then,

I1 = (35/600)*(Vin + 10) - 1;
I2 = (Vin + 10)/60;

Vout = I2*R4;

plot(Vin,Vout,"g");
grid on;
xlabel("Input Voltage(Vin)");
ylabel("Output Voltage(Vout)");
title("Vin vs Vout");


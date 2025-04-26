R = 10;
I = 0:2:10;
V = I * R;
P = (I.^2)/R;   %element wise division
disp(table(I',V',P','VariableNames',{'Current_A','Voltage_V','Power_W'}));



syms s

C1 = 26.25*(s + 4) / (s*(s + 3.5)*(s + 5)*(s + 6));

C2 = 26.25*(s + 4) / (s*(s + 4.01)*(s + 5)*(s + 6));

c1 = ilaplace(C1);
disp('c1 = ')
vpa(c1, 3)

c2 = ilaplace(C2);
disp('c2 = ')
vpa(c2, 3)
numg=[1 12];
deng=poly([ 14 18]);
G=tf(numg,deng);
Kpdk=dcgain(G);
estep=0.1;
K=(1/estep-1)/Kpdk;
T=feedback(G,1);
poles=pole(T);
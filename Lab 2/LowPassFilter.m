%To design a LPF with cutoff frequency 124 kHz or 124000 Hz -
fc = 124000;
R = 3500;
C = 1/(2*pi*R*fc);
%Then, in Transfer function-
numerator = [0 0 1];
denominator = [0 R*C 1];
w = logspace(-15,20);
h = freqs(numerator,denominator,w);
f = w/(2*pi);
magnitude = 20*log10(abs(h));
semilogx(f,magnitude,'g');
grid on;
xlabel('Frequency, Hz');
ylabel('Gain, dB');
xline(124000,'r','124 kHz');
yline(-3,'b','-3 dB');

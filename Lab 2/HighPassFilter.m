%To design a RL HPF with cutoff frequency 124 kHz or 124000 Hz -
fc = 124000;
R = 3900;
L = R/(2*pi*fc);
%Then, in Transfer function-
numerator = [0 L 0];
denominator = [0 L R];
w = logspace(-15,30);
h = freqs(numerator,denominator,w);
f = w/(2*pi);
magnitude = 20*log10(abs(h));
semilogx(f,magnitude,'g');
grid on;
xlabel('Frequency, Hz');
ylabel('Gain, dB');
xline(124000,'r','124kHz');
yline(-3,'b','-3 dB');

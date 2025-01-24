%To design a RLC BPF with cutoff frequency 124 kHz or 124000 Hz -
fc = 124000;
%BandWidth = 124200-123800 = 400 Hz
BW = 800*pi;
R = 1200;
Q = 2*pi*fc/BW;
L = (R*Q)/(2*pi*fc);
C = 1/(2*pi*fc*R*Q);
%Then, in Transfer function-
numerator = [0 R*C 0];
denominator = [L*C R*C 1];
w = logspace(-44,40);
h = freqs(numerator,denominator,w);
f = w/(2*pi);
magnitude = 20*log10(abs(h));
semilogx(f,magnitude,'g');
grid on;
xlabel('Frequency, Hz');
ylabel('Gain, dB');
xline(124000,'r','124 kHz');

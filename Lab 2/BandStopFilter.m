%To design a RLC BSF with cutoff frequency 124 kHz or 124000 Hz -
fc = 124000;
%BandWidth = 124200-123800 = 400
BW = 2*pi*800;
R = 2000;
Q = 2*pi*fc/BW;
L = (R*Q)/(2*pi*fc);
C = 1/(4*pi*pi*fc*fc*L);
%Then, in Transfer function-
numerator = [L*C 0 1];
denominator = [L*C R*C 1];
w = logspace(-10,30,2000);
h = freqs(numerator,denominator,w);
f = w/(2*pi);
magnitude = 20*log10(abs(h));
semilogx(f,magnitude,'g');
grid on;
xlabel('Frequency, Hz');
ylabel('Gain, dB');
xline(124000,'r','124 kHz');
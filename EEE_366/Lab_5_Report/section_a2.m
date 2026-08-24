N = length(x);
c = zeros(1, N);

for k = 1:N
    c(k) = sum(x .* exp(-1j * 2 * pi * (k-1) * t / T)) / N;
end

disp('DTFS coefficients:');
disp(c);
figure;
stem(0:N-1, abs(c), 'filled');
grid on;
xlabel('k');
ylabel('|C_k|');
title('Magnitude of DTFS Coefficients');
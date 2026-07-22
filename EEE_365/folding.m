%% Animation of Time Reversal

clear;
close all;
clc;

n = -8:8;
x = [0 0 1 2 3 4 3 2 1 0 0 0 0 0 0 0 0];

figure

for alpha = 1:-0.05:-1

    clf

    new_n = alpha*n;

    stem(new_n,x,'filled','LineWidth',2)

    grid on
    xlim([-8 8])
    ylim([0 5])

    if alpha>0
        title('Flipping...')
    else
        title('Time Reversed: x(-n)')
    end

    xlabel('n')
    ylabel('Amplitude')

    pause(0.05)

end
%% Silicon at T = 0 K
figure('Color','w');
hold on; grid on; box on;

% Valence band
patch([-1 1 1 -1],[0 0 0.8 0.8],[0.75 0.85 1.0], ...
      'EdgeColor','k');
text(0,0.4,'VALENCE BAND','HorizontalAlignment','center', ...
     'FontWeight','bold');

% Conduction band
patch([-1 1 1 -1],[2 2 2.8 2.8],[0.9 0.9 0.9], ...
      'EdgeColor','k');
text(0,2.4,'CONDUCTION BAND','HorizontalAlignment','center', ...
     'FontWeight','bold');

% Bandgap
text(0,1.4,'E_g','HorizontalAlignment','center', ...
     'FontSize',14,'FontWeight','bold');

ylabel('Energy');
title('Silicon Semiconductor at T = 0 K');
xlim([-1.5 1.5]);
ylim([-0.2 3.1]);
xticks([]);
hold off;
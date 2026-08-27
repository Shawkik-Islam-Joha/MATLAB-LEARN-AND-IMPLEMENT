%% Thermal generation of an electron-hole pair
figure('Color','w');
hold on; box on; grid on;

% Bands
patch([-1 1 1 -1],[0 0 0.8 0.8], ...
      [0.75 0.85 1.0],'EdgeColor','k');
patch([-1 1 1 -1],[2 2 2.8 2.8], ...
      [0.9 0.9 0.9],'EdgeColor','k');

% Electron
plot(0.35,2.35,'ko','MarkerFaceColor','k','MarkerSize',9);
text(0.48,2.35,'electron','VerticalAlignment','middle');

% Hole
plot(-0.35,0.45,'ko','MarkerFaceColor','w','MarkerSize',10);
text(-0.2,0.45,'hole','VerticalAlignment','middle');

% Transition arrow
annotation('textarrow',[0.58 0.58],[0.45 0.75], ...
           'String','thermal energy');

text(0,0.4,'Valence band','HorizontalAlignment','center');
text(0,2.4,'Conduction band','HorizontalAlignment','center');

ylabel('Energy');
title('Thermal Generation of an Electron-Hole Pair');
xlim([-1.2 1.2]);
ylim([-0.2 3.1]);
xticks([]);
hold off;
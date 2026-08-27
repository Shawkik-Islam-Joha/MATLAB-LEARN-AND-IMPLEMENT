figure('Color','w');
hold on; box on;

patch([-1 1 1 -1],[0 0 1 1],[0.75 0.85 1], ...
      'EdgeColor','k');
patch([-1 1 1 -1],[5 5 6 6],[0.9 0.9 0.9], ...
      'EdgeColor','k');

text(0,0.5,'Valence band (FULL)', ...
     'HorizontalAlignment','center','FontWeight','bold');
text(0,5.5,'Conduction band (EMPTY)', ...
     'HorizontalAlignment','center','FontWeight','bold');
text(0,3,'Large E_g', ...
     'HorizontalAlignment','center','FontWeight','bold');

ylabel('Energy');
title('Insulator Band Structure');
xlim([-1.5 1.5]);
ylim([-0.5 6.5]);
xticks([]);
hold off;
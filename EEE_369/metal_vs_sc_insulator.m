figure('Color','w');

%% Metal
subplot(1,3,1);
hold on; box on;
patch([-1 1 1 -1],[1 1 3 3],[0.75 0.85 1], ...
      'EdgeColor','k');
% electrons
plot(linspace(-0.8,0.2,7),2*ones(1,7),'ko','MarkerFaceColor','k');
title('Metal');
ylabel('Energy');
xticks([]); yticks([]);
hold off;

%% Semiconductor
subplot(1,3,2);
hold on; box on;
patch([-1 1 1 -1],[0 0 1 1],[0.75 0.85 1], ...
      'EdgeColor','k');
patch([-1 1 1 -1],[2 2 3 3],[0.9 0.9 0.9], ...
      'EdgeColor','k');
text(0,1.5,'E_g','HorizontalAlignment','center');
title('Semiconductor');
xticks([]); yticks([]);
hold off;

%% Insulator
subplot(1,3,3);
hold on; box on;
patch([-1 1 1 -1],[0 0 1 1],[0.75 0.85 1], ...
      'EdgeColor','k');
patch([-1 1 1 -1],[5 5 6 6],[0.9 0.9 0.9], ...
      'EdgeColor','k');
text(0,3,'Large E_g','HorizontalAlignment','center');
title('Insulator');
xticks([]); yticks([]);
hold off;

sgtitle('Energy-Band View of Electrical Conduction');

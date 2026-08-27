%% EEE 369 - Chapter 3.1 Visualization
% MATLAB diagrams for the concepts needed later in Sections 3.4-3.5.
% The figures are schematic illustrations of the textbook concepts.

clear; close all; clc;

%% Figure 1: Splitting of an atomic energy level
figure('Name','3.1 - Energy Level Splitting','Color','w');
hold on; box on; grid on;

% One isolated atom
y0 = 2.0;
plot([0.8 2.2],[y0 y0],'k','LineWidth',2);
text(2.3,y0,'One atomic energy level','VerticalAlignment','middle');

% Two interacting atoms: split level
plot([4.0 5.4],[y0+0.18 y0+0.18],'k','LineWidth',2);
plot([4.0 5.4],[y0-0.18 y0-0.18],'k','LineWidth',2);
text(5.5,y0+0.18,'Higher state','VerticalAlignment','middle');
text(5.5,y0-0.18,'Lower state','VerticalAlignment','middle');

% Many atoms: closely spaced levels
levels = linspace(0.65,3.35,18);
for E = levels
    plot([7.2 8.6],[E E],'k','LineWidth',1);
end
text(8.75,2.0,'Many closely spaced levels','VerticalAlignment','middle');

xlim([0 11]); ylim([0.2 3.8]);
xticks([1.5 4.7 7.9]);
xticklabels({'Isolated atom','Two interacting atoms','Many atoms'});
yticks([]);
title('From Atomic Energy Levels to an Energy Band');
hold off;


%% Figure 2: Allowed bands and forbidden energy gap
figure('Name','3.1 - Allowed and Forbidden Bands','Color','w');

E = [1.0 2.2 3.7 4.7];
hold on; box on;
rectangle('Position',[1,E(1),2,E(2)-E(1)], ...
          'FaceColor',[0.82 0.88 0.95],'EdgeColor','k','LineWidth',1.5);
rectangle('Position',[1,E(3),2,E(4)-E(3)], ...
          'FaceColor',[0.82 0.88 0.95],'EdgeColor','k','LineWidth',1.5);

% Forbidden gap
patch([1 3 3 1],[E(2) E(2) E(3) E(3)], ...
      [0.95 0.95 0.95],'EdgeColor','none');

text(2,E(1)+(E(2)-E(1))/2,'Allowed band', ...
    'HorizontalAlignment','center','FontWeight','bold');
text(2,(E(2)+E(3))/2,'Forbidden gap', ...
    'HorizontalAlignment','center','FontWeight','bold');
text(2,E(3)+(E(4)-E(3))/2,'Allowed band', ...
    'HorizontalAlignment','center','FontWeight','bold');

% Eg arrow
plot([3.5 3.5],[E(2) E(3)],'k','LineWidth',1.5);
plot(3.5,E(2),'k>','MarkerFaceColor','k');
plot(3.5,E(3),'k<','MarkerFaceColor','k');
text(3.7,(E(2)+E(3))/2,'E_g','FontSize',13,'FontWeight','bold');

xlim([0 5]); ylim([0.5 5.2]);
xticks([]); ylabel('Energy');
title('Allowed Energy Bands and Forbidden Energy Gap');
hold off;


%% Figure 3: Free-electron E-k relation
figure('Name','3.1 - Free Electron E-k','Color','w');

k = linspace(-3,3,500);
hbar = 1; m = 1;              % normalized units for visualization
Efree = (hbar^2*k.^2)/(2*m);

plot(k,Efree,'LineWidth',2);
grid on; box on;
xlabel('k');
ylabel('Energy, E');
title('Free Electron: E = \hbar^2 k^2 / (2m)');
xline(0,'k:');
yline(0,'k:');
text(0.15,max(Efree)*0.15,'Parabolic E-k relation');


%% Figure 4: Schematic semiconductor E-k diagram
figure('Name','3.1 - Semiconductor E-k Diagram','Color','w');

k = linspace(-2,2,500);

% Schematic conduction and valence bands
Ec = 2.0 + 0.75*k.^2;
Ev = 0.75 - 0.45*k.^2;

plot(k,Ec,'LineWidth',2); hold on;
plot(k,Ev,'LineWidth',2);
grid on; box on;

xlabel('Crystal wave vector, k');
ylabel('Energy, E');
title('Schematic Semiconductor E-k Diagram');

% Mark bandgap at k = 0
Ec0 = 2.0;
Ev0 = 0.75;
plot([0 0],[Ev0 Ec0],'k--','LineWidth',1.5);
text(0.08,(Ev0+Ec0)/2,'E_g','FontSize',13,'FontWeight','bold');

text(-1.75,Ec0+1.0,'Conduction band','FontWeight','bold');
text(-1.75,Ev0-0.7,'Valence band','FontWeight','bold');

legend('Conduction band','Valence band','Location','best');
hold off;


%% Figure 5: Why curvature matters for effective mass
figure('Name','3.1 - E-k Curvature','Color','w');

k = linspace(-2,2,500);

% Two illustrative curvatures
E1 = 0.8*k.^2;          % strongly curved
E2 = 0.25*k.^2;         % flatter

plot(k,E1,'LineWidth',2); hold on;
plot(k,E2,'LineWidth',2);
grid on; box on;

xlabel('k');
ylabel('Energy, E');
title('E-k Curvature and the Idea of Effective Mass');
legend('Large curvature','Small curvature','Location','northwest');

text(-1.85,3.2,'m^* = \hbar^2 / (d^2E/dk^2)', ...
    'FontSize',12,'FontWeight','bold');
hold off;

%% End
disp('Chapter 3.1 visualization complete.');

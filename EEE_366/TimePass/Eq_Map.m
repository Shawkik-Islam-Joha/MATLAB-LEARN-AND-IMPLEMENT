clc;
clear;
close all;

%% -------------------------------
% Sample Earthquake Data
% Latitude, Longitude, Magnitude, Depth (km)
%% -------------------------------

data = [
    38.322  142.369  9.1   29;    % Japan
    -38.297 -73.050  8.8   35;    % Chile
    3.295   95.982   9.1   30;    % Sumatra
    27.988  86.925   7.8   15;    % Nepal
    35.705  140.688  6.9   45;    % Japan
    37.174 -121.654  5.5   10;    % California
    -6.214  106.845  6.2   18;    % Indonesia
    24.894  91.868   5.2   12;    % Bangladesh
    41.008  28.978   7.5   20;    % Turkey
    -20.348 -70.143  8.2   25;    % Chile
];

lat = data(:,1);
lon = data(:,2);
mag = data(:,3);
depth = data(:,4);

%% -------------------------------
% Create Figure
%% -------------------------------

figure('Color','w');
hold on;
grid on;

title('World Earthquake Map');
xlabel('Longitude (°)');
ylabel('Latitude (°)');

xlim([-180 180]);
ylim([-90 90]);

%% Draw Latitude & Longitude Grid

for x = -180:30:180
    xline(x,':','Color',[0.8 0.8 0.8]);
end

for y = -90:30:90
    yline(y,':','Color',[0.8 0.8 0.8]);
end

%% -------------------------------
% Plot Earthquakes
%% -------------------------------

scatter(lon,...
        lat,...
        mag.^3*8,...
        depth,...
        'filled');

colormap(jet)
colorbar

cb = colorbar;
cb.Label.String = 'Depth (km)';

%% Add Labels

for i = 1:length(lat)

    text(lon(i)+2,...
         lat(i),...
         sprintf('M %.1f',mag(i)),...
         'FontSize',8);

end

%% Beautify

set(gca,...
    'FontSize',11,...
    'LineWidth',1.2);

axis equal
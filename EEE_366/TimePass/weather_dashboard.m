clc;
clear;
close all;

%% ==============================
% OpenWeather Settings
%% ==============================

apiKey = '2392c47fe0b826343916585db753bc8e';     % <-- Replace with your own key
city = 'Chattogram';         % Change to any city

url = sprintf(['https://api.openweathermap.org/data/2.5/weather?' ...
               'q=%s&appid=%s&units=metric'], city, apiKey);

%% ==============================
% Download Weather Data
%% ==============================

try
    weather = webread(url);
catch
    error('Unable to connect to OpenWeather API.\nCheck your internet connection, API key, or city name.');
end

%% ==============================
% Extract Data
%% ==============================

temp      = weather.main.temp;
feelsLike = weather.main.feels_like;
humidity  = weather.main.humidity;
pressure  = weather.main.pressure;
wind      = weather.wind.speed;
condition = weather.weather(1).main;
desc      = weather.weather(1).description;

%% ==============================
% Dark Dashboard
%% ==============================

figure(...
    'Name','Live Weather Dashboard',...
    'Color',[0.08 0.08 0.08],...
    'Position',[150 80 1200 700]);

tiledlayout(2,3,...
    'TileSpacing','compact',...
    'Padding','compact');

%% ==============================
% Temperature
%% ==============================

nexttile

bar(temp,...
    'FaceColor',[1 0.4 0],...
    'EdgeColor','none');

ylim([0 50])

title('Temperature',...
    'Color','w',...
    'FontSize',14)

ylabel('°C',...
    'Color','w')

set(gca,...
    'Color',[0.12 0.12 0.12],...
    'XColor','w',...
    'YColor','w',...
    'FontSize',12)

grid on

%% ==============================
% Humidity
%% ==============================

nexttile

gauge = bar(humidity,...
    'FaceColor',[0 0.7 1]);

ylim([0 100])

title('Humidity',...
    'Color','w')

ylabel('%',...
    'Color','w')

set(gca,...
    'Color',[0.12 0.12 0.12],...
    'XColor','w',...
    'YColor','w')

grid on

%% ==============================
% Wind Speed
%% ==============================

nexttile

bar(wind,...
    'FaceColor',[0.3 1 0.5])

ylim([0 max(10,wind+2)])

title('Wind Speed',...
    'Color','w')

ylabel('m/s',...
    'Color','w')

set(gca,...
    'Color',[0.12 0.12 0.12],...
    'XColor','w',...
    'YColor','w')

grid on

%% ==============================
% Pressure
%% ==============================

nexttile

bar(pressure,...
    'FaceColor',[1 1 0])

ylim([900 1100])

title('Pressure',...
    'Color','w')

ylabel('hPa',...
    'Color','w')

set(gca,...
    'Color',[0.12 0.12 0.12],...
    'XColor','w',...
    'YColor','w')

grid on

%% ==============================
% Feels Like
%% ==============================

nexttile

bar(feelsLike,...
    'FaceColor',[1 0 0.4])

ylim([0 50])

title('Feels Like',...
    'Color','w')

ylabel('°C',...
    'Color','w')

set(gca,...
    'Color',[0.12 0.12 0.12],...
    'XColor','w',...
    'YColor','w')

grid on

%% ==============================
% Summary Panel
%% ==============================

nexttile
axis off

set(gca,...
    'Color',[0.08 0.08 0.08])

text(0.05,0.92,...
    city,...
    'Color','cyan',...
    'FontSize',22,...
    'FontWeight','bold')

text(0.05,0.78,...
    sprintf('🌡 Temperature : %.1f °C',temp),...
    'Color','w',...
    'FontSize',14)

text(0.05,0.66,...
    sprintf('🥵 Feels Like : %.1f °C',feelsLike),...
    'Color','w',...
    'FontSize',14)

text(0.05,0.54,...
    sprintf('💧 Humidity : %d %%',humidity),...
    'Color','w',...
    'FontSize',14)

text(0.05,0.42,...
    sprintf('🌬 Wind : %.1f m/s',wind),...
    'Color','w',...
    'FontSize',14)

text(0.05,0.30,...
    sprintf('🧭 Pressure : %d hPa',pressure),...
    'Color','w',...
    'FontSize',14)

text(0.05,0.18,...
    ['☁ Weather : ' upper(condition)],...
    'Color',[1 0.8 0],...
    'FontSize',16,...
    'FontWeight','bold')

text(0.05,0.08,...
    ['Description : ' desc],...
    'Color',[0.8 0.8 0.8],...
    'FontSize',12)

%% ==============================
% Overall Title
%% ==============================

sgtitle('LIVE WEATHER DASHBOARD',...
    'Color','w',...
    'FontSize',20,...
    'FontWeight','bold')

fprintf('\nWeather Updated Successfully!\n');
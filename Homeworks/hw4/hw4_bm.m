%% Plot 1
% Opens Stonewall Buoy data file and removes the first three rows from the

clear all
clc 
close all

fid=fopen('hw4_data.txt');
fgetl(fid); fgetl(fid);fgetl(fid);
% This is the formatting string for each column of data.
[data]=textscan(fid,'%d%d%d%d%d%d%f%f%f%f%f%d%f%f%f%f%f%f');
fclose(fid);

% Calling airtemp data, the 14th column of the string array.
airtemp = data{14}(:,1);
% Assigning year, month, day, hour, minute, sec, for each column of

year = (data{1});
month = (data{2});
day = (data{3});
hour = (data{4});
minute = (data{5});

% Assigns zero to second values for all rows.
second = zeros(size(minute));

% Converting year, month, day, hour, minute, second to decimal day

time = datetime(year,month,day,hour,minute,second,'format','dd-MMM-uuuu HH:mm:ss');
time2 = datetime(year,month,day);

%Plot of decimal days vs. airtemp.
figure_1 = figure('Name','Air Temperature vs Time');
plot(time,airtemp,'-r','LineWidth',2);
xlabel('Time (Day of Month)');ylabel('Temperature degC');
legend('Temperature')

%% Plot 2
waveheight = (data{9});
windspeed = (data{7});
% Creates a scatterplot for waveheight on x-axis and wavespeed on y-axis
figure_2 = figure('Name','Wave Height versus Wind Speed');
scatter(windspeed,waveheight,"magenta",'filled');
xlabel('Wave Height(m)');ylabel('Wind Speed(m/s)');
legend('Windspeed')

%% 
% Part 2

%Storing variables
WDIR = data{6};
WSPD = data{7};
GST = data{8};
WVHT = data{9};
DPD = data{10};
APD = data{11};
MWD = data{12};
PRES = data{13};
ATMP = data{14};
WTMP = data{15};
DEWP = data{16};
VIS = data{17};
TIDE = data{18};

%setting up timetable for new data
Time = time2;
average = table(Time, WDIR, WSPD, GST, WVHT, DPD, APD, MWD, PRES, ATMP, WTMP, DEWP, VIS, TIDE);
TimeTable = table2timetable(average);

%Setting daily averages usint retime function
DailyAvg = retime(TimeTable, 'daily', 'mean');
DailyAvg = timetable2table(DailyAvg);

%Setting up reasnable decibals for variables
DailyAvg{:,["WDIR", "MWD"]} = round(DailyAvg{:,["WDIR", "MWD"]});
DailyAvg{:,["WSPD", "GST", "PRES", "ATMP", "WTMP"]} = round(DailyAvg{:,["WSPD", "GST", "PRES", "ATMP", "WTMP"]},1);
DailyAvg{:,["WVHT", "DPD", "APD", "TIDE"]} = round(DailyAvg{:,["WVHT", "DPD", "APD", "TIDE"]},2);


%Table output 
writetable(DailyAvg, 'hw4_daily_data.txt', 'Delimiter','\t')
zippedfiles = zip('hw4.zip',{'hw4_bm.m','hw4_data.txt','hw4_daily_data.txt'});

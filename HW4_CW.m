%HW 4

%Use textscan to open file and remove 
fid = fopen('hw4_data.txt');
units = fgetl(fid);
fgetl(fid);
[data] = textscan(fid, '%d%d%d%d%d%d%f%f%f%f%f%d%f%f%f%f%f%f');
fclose(fid);

%Save time variables
yr = double(data{1});
mo = double(data{2});
dy = double(data{3});
hr = double(data{4});
mn = double(data{5});
ss = zeros(length(data{1}),1);
airtemp = data{14};

%Checking sizes
size(ss);
size(yr);

%Using datetime to convert times
t = datetime(yr,mo,dy);
t2 = datetime(yr,mo,dy,hr,mn,ss, 'Format','dd-MMM-uuuu');

%Figure of airtemp
figure1 = plot(t2,airtemp);
ylabel('Air Temperature (C)')
xlabel('Time')
figure1
%%

%Scatter plot
waveheight = data{9};
windspeed = data{7};
figure2 = scatter(windspeed, waveheight)
figure2
%Not correlated...

%% Part 2
%Write in a file
%Average daily values...
%write in a file that doesnt have hh or mn

% for j = unique(mo)
%     for i = unique(dy)
%         find(dy == i)
%         %wave_avg = mean(waveheight(temp))
%     end
% end 

% 
% t4 = datenum(t);
% t4;
% 
% for j = 1:length(unique(t4))
%     idx_day = find(t4 == t4(j));
%     avg = mean(waveheight(idx_day));
%     avg
% end

%%%%%%%%%%%%%%% epic fail :(

%%

%Saving variables
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
Time = t;
average = table(Time, WDIR, WSPD, GST, WVHT, DPD, APD, MWD, PRES, ATMP, WTMP, DEWP, VIS, TIDE);
TimeTable = table2timetable(average);

%Setting daily averages usint retime function
DailyAvg = retime(TimeTable, 'daily', 'mean');
DailyAvg = timetable2table(DailyAvg);

%Setting up reasnable decibals for variables
DailyAvg{:,["WDIR", "MWD"]} = round(DailyAvg{:,["WDIR", "MWD"]});
DailyAvg{:,["WSPD", "GST", "PRES", "ATMP", "WTMP"]} = round(DailyAvg{:,["WSPD", "GST", "PRES", "ATMP", "WTMP"]},1);
DailyAvg{:,["WVHT", "DPD", "APD", "TIDE"]} = round(DailyAvg{:,["WVHT", "DPD", "APD", "TIDE"]},2);

%Table output :)
writetable(DailyAvg, 'hw4_daily_data.txt', 'Delimiter','\t')
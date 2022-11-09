close all
clear all
clc

sum_geo = zeros("double")
map_struct = dir('*.asc')

for map = 1:size(map_struct)
    % Read map data, store info as geographic and double point into A
    [A,R] = readgeoraster(map_struct(map).name,'CoordinateSystemType','geographic','OutputType','double')
    % Add each map data together
    if sum_geo == zeros("double")
        sum_geo = size(A)   % Assing matrix size of georaster data
        sum_geo = A
    else
        sum_geo = plus(sum_geo,A)
    end
end

%Precip over Oregon
%PrecipOR =figure('Name','Total Precipitation in Oregon: 1983')
% lat and long data 
latlim = R.LatitudeLimits
longlim = R.LongitudeLimits
usamap(latlim,longlim)
% Precipitation data on a contour map
OR_map = geoshow(sum_geo,R,'DisplayType','contour','LevelList',[0:200:6000])

ORcolorbar = colorbar
ORcolorbar.Label.String = "Total Annual Precipitation (mm)"
ORcolorbar.FontSize=13
ORcolorbar.LineWidth=1.5
xlabel('Lat')
ylabel('Long')
title('Total Precipitation in Oregon: 1983')


colormapeditor  %if you want to check it out on different colors

print -dpng -r300 or_precip_1983.png

%Code in this link helped https://www.mathworks.com/help/map/ref/readgeoraster.html#mw_0567b72f-5e3b-4015-b041-1e1e04704723

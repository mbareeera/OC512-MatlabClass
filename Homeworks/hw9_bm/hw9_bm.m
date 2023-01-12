close all
clear all
clc


% Load all states 
US_states = shaperead('usastatehi','UseGeoCoords',true);

%Projection
current_ellipsoid =referenceEllipsoid('wgs84');

% Loading PRISM precip data
[A,R] = readgeoraster('/Users/bareeramirza/Desktop/Matlab/PRISM_ppt_30yr_normal_4kmM2_annual_asc/PRISM_ppt_30yr_normal_4kmM2_annual_asc.asc'); %Change it to 'PRISM_ppt_30yr_normal_4kmM2_annual_asc/PRISM_ppt_30yr_normal_4kmM2_annual_asc.asc'


A(isnan(A))=0; % turns every NaN to zeros

%LON / LAT matrices for the grid points 

[LON,LAT]=meshgrid([0:1:R.RasterSize(2)-1]*R.CellExtentInLongitude+R.LongitudeLimits(1), ...
[R.RasterSize(1)-1:-1:0]*R.CellExtentInLatitude+R.LatitudeLimits(1));

% Prepare data for table

VarTypes = ["string","double","double"];
VarNames = ["State", "Area (km^2)", "Precipitation (m)"];
sz = [51 3];

% Table fordf
df  = table('Size', sz,'VariableTypes',VarTypes,'VariableNames',VarNames);

%Loop for area of states task 1
for i = 1:size(US_states)
    
    SOI = US_states(i).Name; % searching states
    lat=US_states(i).Lat; %assign states lon lat 
    lon=US_states(i).Lon;
    
    ROI = areaint(lat(1:end-1),lon(1:end-1),current_ellipsoid)/1000/1000;
    AOI = sum(ROI);
    
    
    df.State(i) = SOI; % Put State name and area into table
    df.("Area (km^2)")(i) = round(AOI);
    
    
    latlim = US_states(i).BoundingBox(:,2)'; % Find bounding box of region of interest
    lonlim = US_states(i).BoundingBox(:,1)';
    
    
    tf = ingeoquad(LAT,LON,latlim,lonlim); %lon lat for precip
    precip_total = 0;
    precip_counter = 0;
    precip_mean = 0;
    
    % Iterating data
    for j = 1:621
        for k = 1:1405
            
            if tf(j,k) == 1   
                
                precip_total = precip_total + A(j,k);
                precip_counter = precip_counter +1; 
            end
        end
    end
    
   
    precip_mean = precip_total/precip_counter;

    df.("Precipitation (m)")(i) = round(precip_mean);
end

writetable(df, "Area_Annual_Precipitation_of_US_States.txt",'Delimiter','tab');

%Worked in group for loop

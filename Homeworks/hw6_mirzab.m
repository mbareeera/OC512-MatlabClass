
clear all
close all
clc
%%
%Bareera Mirza Homework6

%Data and Scatteer Plot
u_ds=[57.12, 75.78, 83.77, 89.58, 94.16, 97.99, 100.81, 102.13, 102.62]; % stream wise velocity cm/s
y_ds=[0.073, 0.44, 0.81, 1.19, 1.56, 1.93, 2.3, 2.67, 3.04]; %y-coordinates
kappa = 0.4;  % m/svon Karman constant
v_water= 0.01; %cm2 s-1
u_star=[0:0.0005:10];

figure("Name",'Raw Data')
plot(u_ds,y_ds,'o')
xlabel('Streamwise Velocity (cm/s)')
ylabel('Height (cm)')
hold on
legend ('velocity')

%Smooth Log Law Part 1

sloglaw = @(z, y_ds) ((z./kappa).*(log((y_ds.*z)./v_water)));
vel1 = nlinfit(y_ds',u_ds',sloglaw,3);

%Plot
plot(sloglaw(vel1,u_star), u_star);

%%
%Part 2

rloglaw=@(t, y_ds) ((t(1)./kappa)*(log(y_ds/t(2)))+8.5*t(1));
vel2 = nlinfit(y_ds',u_ds',rloglaw, [5,0.01]);

%Plot
plot(rloglaw(vel2,u_star), u_star,'m');
title('Curve fit');
xlabel('Flow velocity (cm/s)');
ylabel('Height (cm)');
legend

%% Printing original data, the smooth fit, and the rough fit.
smooth_u = sprintf('%4.4f cm/s is smooth log shear velocity', vel1);
rough_u = sprintf('%4.4f cm/s is rough log shear velocity', vel2(1));
rough_ks = sprintf('%4.4f cm is roughness heigh', vel2(2));
disp(smooth_u)
disp(rough_u)
disp(rough_ks)


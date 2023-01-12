
clear all
close all
clc

%Homework 8 Bareera Mirza

%specify three frequencies
f1=1/10;
f2=1/200;
f3=1/45000;

%Amplitutde
amp1=0.5;
amp2=0.25;
amp3=1.25;

%Timeperiod
T1=10;
T2=200;
T3=4500;

%create a time vector
t=0:0.5:604800;
wave= amp1*sin((2*pi/T1)*t)+amp2*sin((2*pi/T2)*t)+amp3*sin((2*pi/T3)*t);

combine = wave + (0.1*sin(randn(size(wave))));

%plotting raw wave sequence

figure(1)
subplot(4,1,1)
plot(t,combine)
xlim([0 1.35*10^5])
ylim([-2.5 2.5])
hold on
grid on
title('Combined Noise Wave Signal')
xlabel('Time (s)')
ylabel('Displacement (m)')

%Filter all frequencies except for waves
[B,A]=butter(3,[0.075 0.125]);
yfilt=filter(B,A,combine);

subplot(4,1,2)
hold on
plot(t,yfilt,'r');
legend('waves frequency filtering');
xlim([0 500])
title('Waves Signal');
xlabel('Time (s)');
ylabel('Displacement (m)');
grid on

%Filter all frequencies except for infragravity
[B,A]=butter(3,[0.003 0.0075]); 
xfilt=filter(B,A,combine);
subplot(4,1,3);
hold on
plot(t,xfilt,'b')
legend('infragravity waves frequency filtering')
xlim([0 2500])
title('Infragravity Waves Signal');
xlabel('Time (s)');
ylabel('Displacement (m)');
grid on

%Filter all frequencies except for waves
[B,A]=butter(3,3*10^-5,'low');
zfilt=filter(B,A,combine);
subplot(4,1,4);
hold on
plot(t,zfilt,'b')
legend('tide frequency filtering');
xlim([0 13.5*10^4]); %Adrian helped with these numbers
title('Tide Waves Signal');
xlabel('Time (s)');
ylabel('Displacement (m)');
grid on




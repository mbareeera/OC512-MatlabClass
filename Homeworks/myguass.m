%% Test

clc;
clear all 
close all

x=0:20;

%Would be better to use a structure instead of Matrix here, but i am not
%sure if you have studied structures. So lets keep it simple in matrix form

M.sig=[0.5,1,2,3]; %Sig
M.amp=[0.1,0.5,1,2];  %amp
M.vo=[2,4,6,8];%vo

Y = multGauss(M,x)

 %Plot gaussian profile sum
 hold on
 plot(x, Y, 'r--', 'LineWidth',4, 'DisplayName','gaussmf()')
 grid on
 title ('Sum of Multiple Guassian Profiles')
 legend()
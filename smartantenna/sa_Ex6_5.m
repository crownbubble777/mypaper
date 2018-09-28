%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 6: Ex. 6.5                                      %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/29/2004                                        %%
%%                                                         %%
%% This code creates Fig 6.14 of Ex. 6.5, a plot of the    %% 
%%     Doppler fading channel for N = 10 paths.            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% N - # of scatterers                                       %
% a - gaussian amplitude coefficients < 1                   %
% th, ph - uniform phase angles (rad)                       %
% fd - doppler frequency (Hz)                               %
% tmax - maximum time                                       %
% omega - doppler frequency (rad)                           %
% Fs - sampling frequency                                   %
% X, Y - real and imaginary components for Rayleigh         %
% r - Rayleigh envelope                                     %
% rdb - Rayleigh envelope (dB)                              %
%%---------------------------------------------------------%%

%----- Initialize Variables -----%

N = 10;  a = randn(N,1); a = a/max(a);

th = rand(N,1)*2*pi; ph = rand(N,1)*2*pi;

fd = 149; omega = 2*pi*fd;

tmax = 10/fd; t = [0:1000]*tmax/1000;       		

%----- Create real and imaginary parts of fading channel -----%

X = [zeros(1,length(t))];
Y = [zeros(1,length(t))];

for n = 1:N                   			
 X = X + a(n)*cos(omega*cos(th(n))*t + ph(n));
 Y = Y + a(n)*sin(omega*cos(th(n))*t + ph(n));
end

%----- Create envelope of fading channel -----%

r = sqrt(X.^2+Y.^2);  rdB = 20*log10(r);            		

%----- Plot Results -----%

plot(t*1000,rdB,'k')  
title('\bfFigure 6.14: Doppler Fading Channel w/ N = 10 Paths')
xlabel('time (ms)')
ylabel('envelope')
axis([0 65 -30 max(rdB)+1])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 6: Fig 6.16                                     %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/29/2004                                        %%
%%                                                         %%
%% This code creates Fig 6.16, a plot of the Doppler Power %%
%%     Density Spectrum for fast fading with velocity in   %%
%%     example 6.5                                         %%
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
% Sd - Frequency Spectrum                                   %
%%---------------------------------------------------------%%

%----- Initialize Variables -----%

N = 10;  a = randn(N,1); a = a/max(a);

th = rand(N,1)*2*pi; ph = rand(N,1)*2*pi;

fd = 149; omega = 2*pi*fd;

tmax = 10/fd; t = [0:1000]*tmax/1000;  Fs = length(t)/tmax;     		

%----- Create real part of Doppler fading channel, X -----%

X = zeros(1,length(t));

for n = 1:N                   			
    X = X + a(n)*cos(omega*cos(th(n))*t + ph(n));
end

%----- Create Doppler Power Spectrum, Sd -----%

X = [X zeros(1,4*length(X))];       % zero pad for fft
Xf = fft(X);  Xf = fftshift(Xf);

Sd = abs(Xf)/max(abs(Xf));  Sd = Sd.^2;
f = [-length(Xf)/2+1:length(Xf)/2]*Fs/(length(Xf));

%----- Plot Results -----%

plot(f,abs(Xf)/max(abs(Xf)),'k');
axis([ -Fs/50 Fs/50 0 1.2])
title('\bfFigure 3.16 - Doppler Power Density Spectrum')
xlabel('Frequency (Hz)')
ylabel('S_d(f)')
set(gca,'units','norm','position',[ .1 .1 .8 .8])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                           %%
%%  ******************************************************   %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *   %%
%%  ******************************************************   %%
%%                                                           %%
%% Chapter 8: Ex 8.3                                         %%
%%                                                           %%
%% Author: Frank Gross                                       %%
%% McGraw-Hill, 2005                                         %%
%% Date:  3/05/2005                                          %%
%%                                                           %%
%% This code produces Figure 8.8, determines the weights for %%
%%     directing the main beam of an N = 5, d = 0.5 ULA      %%
%%     towards a desired user at tho = 20 deg and nulling    %%
%%     interferers at -20, 40 deg using the Min MSE method.  %%
%%     The resulting weighted array factor pattern is plotted%%
%%     vs. arrival angle.                                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:----------------------%%
% M - # of elements in array                                  %
% d - element spacing in wavelengths                          %
% theta - arrival angle of desired users and interferers (rad)%
% ang - theta in deg                                          %
% th0 - desired user AOA (deg)                                %
% th1, th2 - interferer AOA (deg)                             %
% a0,a1,a2 - steering vectors of desired user and interferers %
% A - matrix of interferer steering vectors                   %
% Rss - signal correlation matrix                             %
% Rnn - noise correlation matrix                              %
% Rii - interferer correlation matrix                         %
% Ruu - total undesired signal correlation matrix             %
% Rxx - total received signal correlation matrix              %
% w - weights of ULA determined using Min MSE method          %
% th - range of AOA's (rad)                                   %
% y - weighted array output                                   %
%%-----------------------------------------------------------%%

%%----- Given Values -----%%

M = 5; d = 0.5; sig2 = .001;

theta = -pi/2:.01:pi/2; ang = theta*180/pi;

th0 = 20*pi/180; th1 = -20*pi/180; th2 = 40*pi/180;

%%----- Determine steering vectors and matrix of steering vectors -----%%

n=1:M;
a0 = exp(1j*2*pi*d*(n-1)*sin(th0)).';   % received angle steering vector
a1 = exp(1j*2*pi*d*(n-1)*sin(th1)).';     % interferer 1 steering vector
a2 = exp(1j*2*pi*d*(n-1)*sin(th2)).';      % interferer 2 steering vector
A = [a1 a2];

%%----- Determine Correlation Matrices -----%%

Rss = a0*a0';
Rnn = sig2*eye(M);              
Rii = A*A';              
Ruu = Rii + Rnn; 
Rxx = Ruu + Rss;

%%----- Determine weights using max SIR method -----%%

w = inv(Rxx)*a0;        

for j = 1:length(theta)
    th = theta(j);
    aa = exp(1j*2*pi*d*(n-1)*sin(th)).';
    y(j) = w'*aa;
end

%%----- Plot Results -----%%

figure(1), plot(ang,abs(y)/max(abs(y)),'k')
xlabel('\theta'), ylabel('|AF(\theta)|')
title('\bfFigure 8.8 - Minimum MSE Patter for 5 Element Array')
axis([-90 90 0 1])
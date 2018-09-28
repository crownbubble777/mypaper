%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                          %%
%%  ******************************************************  %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *  %%
%%  ******************************************************  %%
%%                                                          %%
%% Chapter 4: Fig 4.7                                       %%
%%                                                          %%
%% Author: Frank Gross                                      %%
%% McGraw-Hill, 2005                                        %%
%% Date:  4/24/2004                                         %%
%%                                                          %%
%% This code creates Fig 4.7, a polar plot of an 8 element  %%
%%     Beamsteered ULA with delta = sin(0o), d = 0.5lambda. %% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:---------------------%%
% theta - angle (deg)                                        %    
% theta0 - beamsteering angle (deg)                          %
% N - number of array elements                               %
% d - element spacing in terms of wavelengths (lambda)       %
% AF - array factor of N element array                       %
%%----------------------------------------------------------%%

%%-------------------- Given Values ------------------------%%

theta = 0:0.001:pi; thetao = [20 40 60]*pi/180;

N = 8;  d = 0.5;

%%---------- Determine Array factor for d = 0.25lambda ------%%

AF1 = sin(N*pi*d*(sin(theta)-sin(thetao(1))))./(N*sin(pi*d*(sin(theta)-sin(thetao(1)))));
AF2 = sin(N*pi*d*(sin(theta)-sin(thetao(2))))./(N*sin(pi*d*(sin(theta)-sin(thetao(2)))));
AF3 = sin(N*pi*d*(sin(theta)-sin(thetao(3))))./(N*sin(pi*d*(sin(theta)-sin(thetao(3)))));

%%-------------------- Plot Results -------------------------%%

subplot(311), polar(theta,AF1,'k'), view(90,-90)
legend('\theta_o = 20^o')
title('\bfFigure 4.7 - Array Factor Plots for 8 Element Beamsteered Array')

subplot(312), polar(theta,abs(AF2),'k'), view(90,-90)
legend('\theta_o = 40^o')

subplot(313), polar(theta,AF3,'k'), view(90,-90)
legend('\theta_o = 60^o')
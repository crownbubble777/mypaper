%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                          %%
%%  ******************************************************  %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *  %%
%%  ******************************************************  %%
%%                                                          %%
%% Chapter 4: Fig 4.5                                       %%
%%                                                          %%
%% Author: Frank Gross                                      %%
%% McGraw-Hill, 2005                                        %%
%% Date:  9/6/2004                                          %%
%%                                                          %%
%% This code creates Fig 4.5, a polar plot of a 4 element   %%
%%     Broadside Array with delta = 0 and d = 0.25lambda,   %% 
%%     0.5lambda, 0.75lambda                                %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:---------------------%%
% theta - angle (deg)                                        %                                      
% N - number of array elements                               %
% d - element spacing in terms of wavelengths (lambda)       %
% delta - phase difference between two adjacent elements     %
% AF - array factor of N element array                       %
%%----------------------------------------------------------%%

%%-------------------- Given Values ------------------------%%

theta = 0:0.005:2*pi;
N = 4;

%%---------- Determine Array factor for d = 0.25lambda ------%%

d = 0.25;
delta = 0;      % broadside
AF = sin(N*pi*d*sin(theta) + N*delta/2)./(N*pi*d*sin(theta) + N*delta/2);

%%-------------------- Plot Results -------------------------%%

subplot(311)
polar(theta,abs(AF),'k')
view(90,-90)
legend('d = 0.25\lambda')
title('\bf\itFigure 4.5 - Array Factor Plots of 4 Element Broadside Array for d/\lambda = 0.25, 0.5, 0.75')

%%----------- Determine Array factor for d = 0.5lambda ------%%

d = 0.5;
delta = 0;      % broadside

AF = sin(N*pi*d*sin(theta) + N*delta/2)./(N*pi*d*sin(theta) + N*delta/2);

%%-------------------- Plot Results -------------------------%%

subplot(312)
polar(theta,abs(AF)/max(abs(AF)),'k')
view(90,-90)
legend('d = 0.5\lambda')

%%---------- Determine Array factor for d = 0.75lambda ------%%

d = 0.75;
delta = 0;      % broadside
AF = sin(N*pi*d*sin(theta) + N*delta/2)./(N*pi*d*sin(theta) + N*delta/2);

%%-------------------- Plot Results -------------------------%%

subplot(313)
polar(theta,abs(AF),'k')
view(90,-90)
legend('d = 0.75\lambda')
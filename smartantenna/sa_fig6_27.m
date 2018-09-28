%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 6: Fig 6.27                                     %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/30/2004                                        %%
%%                                                         %%
%% This code creates Fig 6.27, a plot of the power angular %%
%%     profile for indoor scattering.                      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% sigtheta - RMS angular spread                             %
% theta - angle (rad)                                       %
% Ptot - Total power in all angular paths                   %
% P - Power Angular Profile                                 %
%%---------------------------------------------------------%%

%%------------------ Given Values ------------------%%

sigtheta = pi/6;   theta = -pi/2:pi/400:pi/2;

Ptot = pi;

%%--------- Determine Power Angular Profile ---------%%

P = Ptot*exp(-abs(sqrt(2)*theta/sigtheta))/(sqrt(2)*sigtheta);

%%------------------ Plot Results -------------------%%

plot(theta*180/pi,P,'k')

axis([-90 90 0 5])

title('\bfFig 6.27 - Power Angular Profile for Indoor Scattering')
xlabel('Arrival Angle (deg)')
Ylabel('P(\theta)')
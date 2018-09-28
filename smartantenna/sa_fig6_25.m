%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 6: Fig 6.25                                     %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/30/2004                                        %%
%%                                                         %%
%% This code creates Fig 6.25, a plot of the power angular %%
%%     profile for a disk of scatterers.                   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% theta_max - maximum arrival angle                         %
% theta - angle (rad)                                       %
% Ptot - Total power in all angular paths                   %
% P - Power Angular Profile                                 %
%%---------------------------------------------------------%%

%%------------------ Given Values ------------------%%

theta_max = pi/4;   theta = -pi/4:pi/400:pi/4;

Ptot = pi;

%%--------- Determine Power Angular Profile ---------%%

P = 2*Ptot*sqrt(theta_max^2 - theta.^2)/(pi*theta_max^2);

%%------------------ Plot Results -------------------%%

plot(theta*180/pi,P,'k')

axis([-90 90 0 3])

title('\bfFig 6.25 - Power Angular Profile for a Disk of Scatterers')
xlabel('Arrival Angle (deg)')
ylabel('P(\theta)')
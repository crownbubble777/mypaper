%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 6: Fig 6.23                                     %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/30/2004                                        %%
%%                                                         %%
%% This code creates Fig 6.23, a plot of the power angular %%
%%     profile for a ring of scatterers.                   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% theta_max - maximum arrival angle                         %
% theta - angle (rad)                                       %
% Ptot - Total power in all angular paths                   %
% P - Power Angular Profile                                 %
%%---------------------------------------------------------%%

%%------------------ Given Values ------------------%%

theta_max = pi/4;   theta = (-pi/4+0.01):0.001:(pi/4-0.01);

Ptot = pi;

%%--------- Determine Power Angular Profile ---------%%

P = Ptot./(pi*sqrt(theta_max^2-theta.^2));

%%------------------ Plot Results ------------------%%

plot(theta*180/pi,P,'k')

axis([-90 90 0 8])

title('\bfFig 6.23 - Power Angular Profile for a Ring of Scatterers')
xlabel('Arrival Angle (deg)')
ylabel('P(\theta)')

line([-45 -45],[0 8],'linestyle','--','color','k')
line([45 45],[0 8],'linestyle','--','color','k')
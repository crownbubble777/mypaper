%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 6: Fig 6.28                                     %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/30/2004                                        %%
%%                                                         %%
%% This code creates Fig 6.28, a plot of the power delay   %%
%%     angular profile using values from Ex. 6.7 & 6.8.    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% P - Power angular profile for each angle of arrival       %
% d - delay (tau)                                           %
% angle - vector containing angles of arrival (theta)       %
% Z - Total power delay angular profile                     %
%%---------------------------------------------------------%%

%%------------------ Given Values ------------------%%

P = [.1 .31 .1 .032];

d = 0:.2:6;   angle = -90:5:90;

%%----- Determine Power Delay Angular Profile ------%%

[x y] = meshgrid(d,angle);

Z1 = (abs(x - 0) + abs(y - (-80))<=.01)*P(1);
Z2 = (abs(x - 1) + abs(y - (-45))<=.01)*P(2);
Z3 = (abs(x - 3) + abs(y - (40))<=.01)*P(3);
Z4 = (abs(x - 5) + abs(y - (60))<=.01)*P(4);

Z = Z1 + Z2 + Z3 + Z4;

%%------------------ Plot Results -------------------%%

mesh(y,x,Z)

title('\bfFig 6.28 - Power Delay Angular Profile','Fontweight','bold')
ylabel('Delay (\mus)')
xlabel('Arrival Angle (deg)')
Zlabel('P(\tau,\theta)')

axis([-90 90 0 6 0 .4])
colormap([0 0 0])
set(gca,'ydir','reverse')
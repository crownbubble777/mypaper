%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                        %%
%% ****************************************************** %%
%% * Smart Antennas for Wireless Applications w/ Matlab * %%
%% ****************************************************** %%
%%                                                        %%
%% Chapter 3: Ex 3.2                                      %%
%%                                                        %%
%% Author: Frank Gross                                    %%
%% McGraw-Hill, 2005                                      %%
%% Date:  9/3/2004                                        %%
%%                                                        %%
%% This code creates a polar plot of the Power Density    %%
%%     W(r,theta) vs. theta (deg) for radii r1 = 100 m &  %%
%%     r2 = 200 m, similar to Fig 3.4.                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:---------------------%%
% theta - angle (deg)                                        %                                      
% r1,r2 - far field distances for isotropic antenna (meters) %
% W1,W2 - Power Densities for radii r1,r2 (watts/meters^2)   %
%%----------------------------------------------------------%%

%%------------------ Given Values ------------------%%

theta = 0:0.1:2*pi;      % 63 values of theta from 0 to 2pi
r1 = 100; r2 = 200;

%%------------- Determine Power Densities ----------------%%

W1 = 13.3*sin(theta).^2/r1^2;
W2 = 13.3*sin(theta).^2/r2^2;

%%------------------ Plot Results -------------------%%

polar(theta,W1,'k-.')   % polar plot of W1 vs. theta (blue)
hold on
polar(theta,W2,'k') % polar plot of W2 vs. theta (red)
hold off
view(90,-90)
title('\itFig 3.4 - Power Density (W/m^2) vs. \theta (deg) - Polar','Fontweight','Bold')
legend('W(r_1,\theta)','W(r_2,\theta)')%加不加这个就看右上角有没有框框w（）和w（）而已
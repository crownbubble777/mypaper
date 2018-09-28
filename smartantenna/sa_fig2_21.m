%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 2: Figure 2.21                                  %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  11/13/2004                                       %%
%%                                                         %%
%% This code creates Figure 2.21, a plot of the path gain  %%
%%     factor for knife edge diffraction.                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%--------------------------- Define Variables:------------%%
% hcc - distance between direct path and knife edge         %
% Fd - path gain factor due to diffraction                  %
%%---------------------------------------------------------%%

hcc = -5;
inc = .01;
for k = 1:1000
    Hc = hcc + k/100;
    height(k) = Hc;
    u = [];
    u = Hc:inc:90;
    Fd(k) = abs(inc*trapz(exp(-1j*pi*(u.^2)/2)))/sqrt(2);
end

%%----- Plot Results -----%%

figure(1), plot(height,Fd,'k')
xlabel('H_c'), ylabel('F_d')
title('\bfFigure 2.21 - Path Gain Factor Due to Knife Edge Diffraction')    
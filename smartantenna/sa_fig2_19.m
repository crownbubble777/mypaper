%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 2: Fig. 2.19                                    %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  11/13/2004                                       %%
%%                                                         %%
%% This code creates Figure 2.19, a plot of path gain      %%
%%     factor, F, for the flat earth model with two        %%
%%     isotropic antennas.                                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%----------------- Define Variables: ---------------------%%
% h2 - height of receive antenna w.r.t. wavelength          %
% h1 - height of transmit antenna                           %
% d - distance between antennas                             %
% 
%%---------------------------------------------------------%%

%%----- Givens -----%%

h2 = 0:.1:80; h1 = 5; d = 200;

%%----- Determine Path Gain Factor -----%%

F = 2*abs(sin(2*pi*h1*h2/d));

%%----- Plot Results -----%%

figure(1), plot(h2,F,'k')
ylabel('F'), xlabel('h_2/\lambda')
title('\bfFigure 2.19 - Path Gain Factor for Flat Earth Model of 2 Isotropic Antennas')
axis([0 80 0 3])
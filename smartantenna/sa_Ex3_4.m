%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 3: Ex 3.4                                       %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/3/2004                                         %%
%%                                                         %%
%% This code creates Ex. 3.4, a 3-D radiation pattern for  %%
%%     the radiation intensity U(theta) = cos(theta)^2     %% 
%%     (watts) using MATLAB's ezmesh function.             %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%--------------------------- Define Variables:------------------------------%%
% fx - x = U(theta)sin(theta)cos(phi);  x spherical coordinate for U(theta)   % 
% fy - y = U(theta)sin(theta)sin(phi);  y spherical coordinate for U(theta)   %
% fz - z = U(theta)cos(phi);            z spherical coordinate for U(theta)   %
%%---------------------------------------------------------------------------%%

%%------------- Create inline object functions for plotting --------------%%

fx = inline('cos(theta)^2*sin(theta)*cos(phi)');
fy = inline('cos(theta)^2*sin(theta)*sin(phi)');
fz = inline('cos(theta)^2*cos(theta)');

%%---------------------------- Plot Results ------------------------------%%

ezmesh(fx,fy,fz,[0 2*pi 0 pi],100)
title('\bfExample 3.4: 3D radiation pattern for U(\theta) = cos^2\theta')
% Alter Image Characteristics

colormap([0 0 0])       % Sets mesh color to black, [1 1 1] - white, [1 0 0] is red, etc.
axis equal
set(gca,'xdir','reverse','ydir','reverse')
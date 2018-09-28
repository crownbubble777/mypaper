%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                          %%
%%  ******************************************************  %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *  %%
%%  ******************************************************  %%
%%                                                          %%
%% Chapter 3: Fig 3.7                                       %%
%%                                                          %%
%% Author: Frank Gross                                      %%
%% McGraw-Hill, 2005                                        %%
%% Date:  9/3/2004                                          %%
%%                                                          %%
%% This code creates a 3-D field pattern given by the array %%
%%     factor for an N element linear antenna array using   %%
%%     the MATLAB function ezsurf.                          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:---------------------%%
% fx - inline object for x spherical coordinate              %
% fy - inline object for y spherical coordinate              %
% fz - inline object for z spherical coordinate              %
%%----------------------------------------------------------%%

%warning off MATLAB:divideByZero

%%-- Create inline object functions for array factor in each dimension --%%

fx = inline('abs(sin(3*pi*sin(theta))/(3*pi*sin(theta)))*sin(theta)*cos(phi)');
fy = inline('abs(sin(3*pi*sin(theta))/(3*pi*sin(theta)))*sin(theta)*sin(phi)');
fz = inline('abs(sin(3*pi*sin(theta))/(3*pi*sin(theta)))*cos(theta)');

%%---------------------- Plot Results ----------------------%%

figure
ezsurf(fx,fy,fz,[pi,-pi,0,pi/2],100)
title('\itFig 3.7 - 3-D Field Pattern Plot','Fontweight','bold')

% Alter image characteristics

shading interp
colormap(gray)
brighten(.5)
camlight(20,-20,'infinite')
material dull
lighting phong

% Alter axes

axis square
axis equal
axis([-.5 .5 -.5 .5 0 1])
set(gca,'XDir','reverse','YDir','reverse')
view(-63,24)
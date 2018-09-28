%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 3: Fig 3.19 a, b & c                            %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  1/26/2005                                        %%
%%                                                         %%
%% This code creates Figure 3.19, 3-D pattern for loop     %%
%%     antennas with circumference C/lambda.               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:-------------------------%%
% u - finite length dipole radiation intensity                   %
% theta - elevation plane angle                                  %
% L_lambda - dipole length in wavelengths (L/lambda) for 2D plot %
% L - dipole length in wavelengths (L/lambda) for 3D plot        %
% fx - inline object for x spherical coordinate                  %
% fy - inline object for y spherical coordinate                  %
% fz - inline object for z spherical coordinate                  %
%%--------------------------------------------------------------%%

%----- Calculate 3-D patterns for loop antennas of circumference C/lambda = .5, 1.25, 3 -----%

C = input('What is the circumference of the loop antenna in wavelengths: 0.5, 1.25 or 3?  ');

fx=inline('besselj(1,3*sin(theta))^2*sin(theta)*cos(phi)');
fy=inline('besselj(1,3*sin(theta))^2*sin(theta)*sin(phi)');
fz=inline('besselj(1,3*sin(theta))^2*cos(theta)');
maxx=besselj(1,3)^2;

%----- Plot Results -----%

figure
ezmesh(fx,fy,fz,[0,pi,0,2*pi],100)
title(['\bfFigure 3.19: 3D Radiation Intensity for Loop Antenna of circumference ',num2str(C),'/\lambda'])
colormap([0 0 0])
axis([-maxx maxx -maxx maxx -maxx maxx])
axis equal
%view(0,24)
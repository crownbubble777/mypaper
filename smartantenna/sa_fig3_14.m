%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                        %%
%% ****************************************************** %%
%% * Smart Antennas for Wireless Applications w/ Matlab * %%
%% ****************************************************** %%
%%                                                        %%
%% Chapter 3: Fig 3.14                                    %%
%%                                                        %%
%% Author: Frank Gross                                    %%
%% McGraw-Hill, 2005                                      %%
%% Date:  9/3/2004                                        %%
%%                                                        %%
%% This code creates a 3-D plot of Infinitesimal Dipole   %%
%%     Radiation using the MATLAB function ezmesh.        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:---------------------%%
% fx - inline object for x spherical coordinate              %
% fy - inline object for y spherical coordinate              %
% fz - inline object for z spherical coordinate              %
%%----------------------------------------------------------%%

%%-------------- Create inline object function -------------%%

fx=inline('sin(theta)^2*sin(theta)*cos(phi)');
fy=inline('sin(theta)^2*sin(theta)*sin(phi)');
fz=inline('sin(theta)^2*cos(theta)');

%%---------------------- Plot results ----------------------%%

ezmesh(fx,fy,fz,[0,2*pi,0,pi],100)

title('\bf\itFig 3.14 - 3-D Plot of Infinitesimal Dipole Radiation')

% Alter image characteristics

shading interp
colormap(gray)
brighten(.5)
camlight(20,-20,'infinite')
material dull
lighting phong

% Alter Axes

axis square
axis equal
set(gca,'XDir','reverse','YDir','reverse')
view(-63,24)
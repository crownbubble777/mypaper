%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                        %%
%% ****************************************************** %%
%% * Smart Antennas for Wireless Applications w/ Matlab * %%
%% ****************************************************** %%
%%                                                        %%
%% Chapter 4: Fig 4.27                                    %%
%%                                                        %%
%% Author: Frank Gross                                    %%
%% McGraw-Hill, 2005                                      %%
%% Date:  9/12/2004                                       %%
%%                                                        %%
%% This code creates Fig 4.27, a 3-D Array Factor Pattern %%
%%     for a Beamsteered Planar Array (thetao = 45 deg,   %%
%%     phio = 45 deg).                                    %%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:-------------------%%
% N - # of antenna elements                                %
% theta - elevation angle (rad) 0 < theta < pi             %
% th0 - elevation beamsteering angle (rad)                 %
% phi - azimuthal angle (rad)   0 < phi < 2pi              %
% ph0 - azimuthal beamsteering angle (rad)                 %
% AF - Array Factor of Circular Array                      %
% x - spherical coordinate transform for AF in x direction % 
% y - spherical coordinate transform for AF in y direction %
% z - spherical coordinate transform for AF in z direction %
%%--------------------------------------------------------%%

%%----- Given Values -----%%

d = 0.5; N = 8; 

th = [0:150]*pi/300; th0 = pi/4; ph = [0:150]*2*pi/150; ph0 = pi/4;

%%----- Create Array of angles based on vectors, theta & phi -----%%

[Th,Ph] = meshgrid(th,ph);

%%----- Create Weighted Array Factors for x & y Directions -----%%

test = kaiser(N,3); wB = test/max(test);  tot = sum(wB);

AFx = 0; AFy = 0;
for i = 1:N
    AFx = AFx + wB(i)*exp(-1j*(i-1)*2*pi*d*(sin(Th).*cos(Ph)-sin(th0).*cos(ph0)));
    AFy = AFy + wB(i)*exp(-1j*(i-1)*2*pi*d*(sin(Th).*sin(Ph)-sin(th0).*sin(ph0)));
end

AFn = AFx.*AFy/tot^2;

%%----- Create Parametric Equations for Spherical Coordinates to Rectangular Coordinates -----%%

x = abs(AFn).*sin(Th).*cos(Ph); y = abs(AFn).*sin(Th).*sin(Ph); z = abs(AFn).*cos(Th);

%%----- Plot Results -----%%

figure(1), mesh(x,y,z)
xlabel('x'), ylabel('y'), zlabel('z')
title('\bfFig 4.27 - 3-D Array Factor Pattern for Beamsteered Planar Array, \theta = 45^o, \phi = 45^o')

% Alter Image Properties

colormap([0 0 0]), axis square, axis equal, view(118,22)
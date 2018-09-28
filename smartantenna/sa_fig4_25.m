%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                        %%
%% ****************************************************** %%
%% * Smart Antennas for Wireless Applications w/ Matlab * %%
%% ****************************************************** %%
%%                                                        %%
%% Chapter 4: Fig 4.25                                    %%
%%                                                        %%
%% Author: Frank Gross                                    %%
%% McGraw-Hill, 2005                                      %%
%% Date:  9/12/2004                                       %%
%%                                                        %%
%% This code creates Fig 4.25, a 3-D Array Factor Pattern %%
%%     for a Beamsteered Circular Array (thetao = 30 deg, %%
%%     phio = 0 deg).                                     %%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:-------------------%%
% N - # of antenna elements                                %
% theta - angle (rad) 0 < theta < pi                       %
% phi - angle (rad)   0 < phi < 2pi                        %
% AF - Array Factor of Circular Array                      %
% x - spherical coordinate transform for AF in x direction % 
% y - spherical coordinate transform for AF in y direction %
% z - spherical coordinate transform for AF in z direction %
%%--------------------------------------------------------%%

%%---------------------- Given Values ----------------------%%

N = 20;
theta = [0:100]*pi/100;
phi = [0:100]*2*pi/100;

%%---- Create Array of angles based on vectors, theta & phi ----%%

[Theta,Phi] = meshgrid(theta,phi);

%%------------------ Create Array Factor AF --------------------%%

AF = [zeros(101,101)];  % Initial Conditions for AF

for n = 1:N;
   AF = AF + exp(-1j*2*pi*(sin(Theta).*cos(Phi - 2*pi*(n - 1)/N) - sin(pi/6)*cos(2*pi*(n-1)/N)));
end

%%-- Create Parametric Equations for Spherical Coordinates to Rectangular Coordinates --%%

x = abs(AF).*sin(Theta).*cos(Phi)/N;, y = abs(AF).*sin(Theta).*sin(Phi)/N;, z = abs(AF).*cos(Theta)/N;

%%--------------------- Plot Results -----------------------%%

mesh(x,y,z)

title('\bfFig 4.25 - 3-D Array Factor Pattern for Beamsteered Circular Array, \theta = 30^o, \phi = 0^o')
xlabel('x'), ylabel('y'), zlabel('z')

% Alter Image Properties

colormap([0 0 0]), axis square, axis equal, view(133,14)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 4: Fig 4.28                                     %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/12/2004                                        %%
%%                                                         %%
%% This code creates Fig 4.28, a 3-D plot of three spot    %%
%%     beams created by a 16x16 Square Planar Array with   %%
%%     spacing dx = dy = d, using Kaiser-Bessel Weights    %%
%%     for alpha = 3.                                      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% d - element spacing (lambda/2)                            %
% N - number of antenna elements in both x & y direction    %
% theta1 - beam 1 angle (30 deg)                            %
% phi1 - beam 1 angle (45 deg)                              %
% theta2 - beam 2 angle (45 deg)                            %
% phi2 - beam 2 angle (60 deg)                              %
% theta3 - beam 3 angle (45 deg)                            %
% phi3 - beam 3 angle (30 deg)                              %
% beta - Kaiser-Bessel attenuation parameter                % 
% Wn - normalized Kaiser-Bessel Weights                     %
% AF1 - Array Factor of Planar Array beam 1                 %
% AF2 - Array Factor of Planar Array beam 2                 %
% AF3 - Array Factor of Planar Array beam 3                 %
% AFn - Total Array Factor Pattern                          %
% x - spherical coordinate transform for AF in x direction  % 
% y - spherical coordinate transform for AF in y direction  %
% z - spherical coordinate transform for AF in z direction  %
%%---------------------------------------------------------%%

%%---------------------- Given Values ----------------------%%

d = 0.5;  N = 16; 

%- Angles -%

theta1 = pi/6;  phi1 = pi/4;
theta2 = pi/4;  phi2 = pi/3;
theta3 = pi/4;  phi3 = pi/6;

%- Weights -%

beta = 3;
Wn = kaiser(N,beta)/max(kaiser(N,beta));

%---------------------------%

th = [0:150]*pi/300;  ph = [0:150]*2*pi/150;  % Vector of angles, theta & phi
[Th,Ph] = meshgrid(th,ph);                    % Create array of angles based on vectors, theta & phi

%%------------------------ Create Array Factor for Beam 1 -----------------------------%%

AFx = 0;  AFy = 0;  % initial conditions

for i = 1:N
    AFx = AFx + Wn(i)*exp(-1j*(i - 1)*2*pi*d*(sin(Th).*cos(Ph) - sin(theta1).*cos(phi1)));
    AFy = AFy + Wn(i)*exp(-1j*(i - 1)*2*pi*d*(sin(Th).*sin(Ph) - sin(theta1).*sin(phi1)));
end

maxx = max(max(abs(AFx)));  maxy = max(max(abs(AFy)));  % maxima to normalize AF1

AF1 = AFx.*AFy/(maxx*maxy);

%%------------------------ Create Array Factor for Beam 2 -----------------------------%%

AFx = 0;  AFy = 0;  % reset intital conditions

for i = 1:N
    AFx = AFx + Wn(i)*exp(-1j*(i - 1)*2*pi*d*(sin(Th).*cos(Ph) - sin(theta2).*cos(phi2)));
    AFy = AFy + Wn(i)*exp(-1j*(i - 1)*2*pi*d*(sin(Th).*sin(Ph) - sin(theta2).*sin(phi2)));
end

maxx = max(max(abs(AFx)));  maxy = max(max(abs(AFy)));

AF2 = AFx.*AFy/(maxx*maxy);

%%------------------------ Create Array Factor for Beam 3 -----------------------------%%

AFx = 0;  AFy = 0;
for i = 1:N
    AFx = AFx + Wn(i)*exp(-1j*(i - 1)*2*pi*d*(sin(Th).*cos(Ph) - sin(theta3).*cos(phi3)));
    AFy = AFy + Wn(i)*exp(-1j*(i - 1)*2*pi*d*(sin(Th).*sin(Ph) - sin(theta3).*sin(phi3)));
end
maxx = max(max(abs(AFx)));  maxy = max(max(abs(AFy)));

AF3 = AFx.*AFy/(maxx*maxy);

%%------------------------ Create Normalized Array Factor -----------------------------%%

AFn = AF1 + AF2 + AF3;

%%-- Create Parametric Equations for Spherical Coordinates to Rectangular Coordinates --%%

x = abs(AFn).*sin(Th).*cos(Ph);
y = abs(AFn).*sin(Th).*sin(Ph);
z = abs(AFn).*cos(Th);

%%-------------------------- Plot Results ---------------------------%%

mesh(x,y,z)

title('\bfFig 4.28 - 3-D AF Pattern for 16 x 16 Planar Array, dx = dy = d = \lambda/2')
xlabel('x')
ylabel('y')
zlabel('z')

%% Alter Image Characteristics %%

colormap([0 0 0])
axis equal
view(100,22)
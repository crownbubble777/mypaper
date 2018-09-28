%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 3: Fig 3.16                                     %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  1/26/2005                                        %%
%%                                                         %%
%% This code creates Figure 3.16, 2D & 3D plots of polar   %% 
%%     patterns for a finite length dipole of lengths      %%
%%     L/lambda = 0.5, 1 & 1.5.                            %%
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

%----- Initialize given variables -----%

theta = -pi:0.01:pi;  L_lambda = 0.5:0.5:1.5;

L = input('What is the length of the finite dipole in wavelengths: 0.5, 1.0 or 1.5?  ');

%----- Compute 2D elevetion plane radiation patterns -----%

u1=((cos(pi*L_lambda(1)*cos(theta))-cos(pi*L_lambda(1)))./sin(theta)).^2;  u1=u1/max(u1);
u2=((cos(pi*L_lambda(2)*cos(theta))-cos(pi*L_lambda(2)))./sin(theta)).^2;  u2=u2/max(u2);
u3=((cos(pi*L_lambda(3)*cos(theta))-cos(pi*L_lambda(3)))./sin(theta)).^2;  u3=u3/max(u3);

%----- Plot Results -----%

figure
polar(theta,u1,'k'), hold on
polar(theta,u2,'k:')
polar(theta,u3,'k-.')
legend('L/\lambda = 0.5','L/\lambda = 1.0','L/\lambda = 1.5')
view(90,-90)

%----- Calculate 3-D patterns for finite length dipoles of length L/lambda = .5, 1, 1.5 -----%    

% Change value of L in inline functions (fx,fy,fz) to produce each figure

fx = inline('((cos(pi*0.5*cos(theta))-cos(pi*0.5))/sin(theta))^2*sin(theta)*cos(phi)');
fy = inline('((cos(pi*0.5*cos(theta))-cos(pi*0.5))/sin(theta))^2*sin(theta)*sin(phi)');
fz = inline('((cos(pi*0.5*cos(theta))-cos(pi*0.5))/sin(theta))^2*cos(theta)');
maxx = max(((cos(pi*L*cos(theta))-cos(pi*L))./sin(theta)).^2);

%----- Plot Results -----%

figure
ezmesh(fx,fy,fz,[0,pi,0,2*pi],100)
colormap([0 0 0])
title(['\bfFigure 3.16: 3D Radiation Intensity for Finite Length Dipole of length ',num2str(L),'/\lambda'])
axis([-maxx maxx -maxx maxx -maxx maxx])
%view(0,24)
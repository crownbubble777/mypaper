%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 2: Ex 2.3                                       %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  11/13/2004                                       %%
%%                                                         %%
%% This code creates Figure 2.13, a plot of the standing   %%
%%     wave pattern for plane wave at normal incidence to  %% 
%%     dielectric boundary where n2 = .5n1                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%----------------- Define Variables: ---------------------%%
% n2 - normalized impedance of medium 2 in terms of n1      %
% R - complex reflection coefficient                        %
% angle - angle of reflection coefficient                   %
% bz - range of propagation where b is phase constant       %
% env - envelope total field in region 1                    % 
%%---------------------------------------------------------%%

%%----- Given Values -----%%

n2 = 0.5; bz = -4*pi:.001:0;

%%----- Determine Reflection Coefficient and Angle -----%%

R = (n2-1)/(n2+1);
angle = atan2(imag(R),real(R));

%%----- Create Envelope of Total Field in Region 1 -----%%

env=sqrt(1+abs(R)^2+2*abs(R)*cos(2*bz+angle));

%%----- Plot Results -----%%

figure(1), plot(bz,env,'k')
xlabel('\betaz'), ylabel('|E_1|')
title('\bfFigure 2.13 - Standing Wave Pattern for Normal Incidence (\eta_2 = .5\eta_1)')
axis([-4*pi 0 0 1.5]), grid on
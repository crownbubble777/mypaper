%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 2: Fig. 2.17                                    %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  11/13/2004                                       %%
%%                                                         %%
%% This code creates Figure 2.17, a plot of the reflection %%
%%     and transmission coefficient for perpendicular      %%
%%     polarization concerning plane waves incident upon a %%
%%     boundary of dielectric media.                       %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%----------------- Define Variables: ---------------------%%
% theta - range of angles (rad)                             %
% ang - theta (deg)                                         %
% er - dielectric constant                                  %
% thetat - transmission angle range                         %
% den - denominator of reflection coefficient equation      %
% g - reflection coefficient                                %
% T - transmission coefficient                              %
%%---------------------------------------------------------%%

%%----- Given Values -----%%

theta = 0:.01:pi/2; ang = theta*180/pi;

er = 2;

%%----- Compute transmission angle -----%%

thetat = asin(sqrt(1/er)*sin(theta));

%%----- Compute reflection and transmission coefficient -----%%

den = cos(theta)+sqrt(er)*cos(thetat);
g2 = (cos(theta)-sqrt(er)*cos(thetat))./den;
T2 = (1+g2);

%%----- Repeat above for er = 8, 32 -----%%

er = 8;
thetat = asin(sqrt(1/er)*sin(theta));
den = cos(theta)+sqrt(er)*cos(thetat);
g3 = (cos(theta)-sqrt(er)*cos(thetat))./den;
T3 = (1+g3);

er = 32;
thetat = asin(sqrt(1/er)*sin(theta));
den = cos(theta)+sqrt(er)*cos(thetat);
g4 = (cos(theta)-sqrt(er)*cos(thetat))./den;
T4 = (1+g4);

%%----- Plot Results -----%%

figure(1), subplot(211), plot(ang,abs(g2),'k',ang,abs(g3),'k',ang,abs(g4),'k')
xlabel('\theta (deg)'), ylabel('|R_\perp|')
title('\bfFigure 2.17 - Reflection and Transmission Coefficients vs. Arrival Angle for Perpendicular Polarization')
text(55,.26,'\epsilon_r_2 = 2');text(40,.45,'\epsilon_r_2 = 8');text(20,.65,'\epsilon_r_2 = 32')
axis([0 90 0 1])

figure(1), subplot(212), plot(ang,abs(T2),'k',ang,abs(T3),'k',ang,abs(T4),'k')
xlabel('\theta (deg)'), ylabel('|T_\perp|')
text(55,.76,'\epsilon_r_2 = 2');text(40,.55,'\epsilon_r_2 = 8');text(20,.38,'\epsilon_r_2 = 32')
axis([0 90 0 1])
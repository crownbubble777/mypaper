%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 2: Fig. 2.15                                    %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  11/13/2004                                       %%
%%                                                         %%
%% This code creates Figure 2.15, a plot of the reflection %%
%%     and transmission coefficient for parallel           %%
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

den = cos(thetat)+sqrt(er)*cos(theta);
g2 = (cos(thetat)-sqrt(er)*cos(theta))./den;
T2 = (1+g2).*cos(theta)./cos(theta);

%%----- Repeat above for er = 8, 32 -----%%

er = 8;
thetat = asin(sqrt(1/er)*sin(theta));
den = cos(thetat)+sqrt(er)*cos(theta);
g3 = (cos(thetat)-sqrt(er)*cos(theta))./den;
T3 = (1+g3).*cos(theta)./cos(theta);

er = 32;
thetat = asin(sqrt(1/er)*sin(theta));

den = cos(thetat)+sqrt(er)*cos(theta);
g4 = (cos(thetat)-sqrt(er)*cos(theta))./den;
T4 = (1+g4).*cos(theta)./cos(theta);

%%----- Plot Results -----%%

figure(1), subplot(211), plot(ang,abs(g2),'k',ang,abs(g3),'k',ang,abs(g4),'k')
xlabel('\theta (deg)'), ylabel('|R_|_||')
title('\bfFigure 2.15 - Reflection and Transmission Coefficients vs. Arrival Angle for Parallel Polarization')
text(20,.22,'\epsilon_r_2 = 2');text(30,.49,'\epsilon_r_2 = 8');text(40,.69,'\epsilon_r_2 = 32')
axis([0 90 0 1])

figure(1), subplot(212), plot(ang,abs(T2),'k',ang,abs(T3),'k',ang,abs(T4),'k')
xlabel('\theta (deg)'), ylabel('|T_|_||')
text(35,1.05,'\epsilon_r_2 = 2');text(42,.75,'\epsilon_r_2 = 8');text(50,.55,'\epsilon_r_2 = 32')
axis([0 90 0 2])
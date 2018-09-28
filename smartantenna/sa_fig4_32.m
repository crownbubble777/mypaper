%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 4: Fig 4.32                                     %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/12/2004                                        %%
%%                                                         %%
%% This code creates Fig 4.32, a 2 Element Fixed Sidelobe  %%
%%     Canceler, for desired signal 0 deg and interferers  %%
%%     theta1 = -45 deg, theta 2 = 60 deg, d = lambda/2.   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% d - Element spacing                                       %
% N - Number of stages in Butler Matrix                     %
% theta - angle (rad)                                       %
% w - Array weights for Array Factor                        %
% AF - Array Factor for Fixed Sidelobe Canceler             %
%%---------------------------------------------------------%%

%%---------------------- Given Values ----------------------%%

d = 0.5;
N = 3;
theta = -pi/2:.01:pi/2;

w = [0.748 + 0.094*j, -0.496, 0.748 - 0.094*j];

%%---------------------- Create Array Factor -------------------------%%

AF = w(1)*exp(-1j*pi*d*sin(theta)) + w(2) + w(3)*exp(1j*pi*d*sin(theta));

%%----------------------- Plot Results ---------------------%%

figure(1), plot(theta*180/pi,abs(AF),'k')
title('\bf\itFig 4.32 - Fixed Sidelobe Canceler for D = 0^o & I_1 = -45^o, I_2 = 60^o')
xlabel('\theta (deg)'), ylabel('|AF|')
grid on

% Alter axis properties 
axis([-90 90 0 1.1]), set(gca,'xTick',[-90:15:90])
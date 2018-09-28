%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                           %%
%%  ******************************************************   %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *   %%
%%  ******************************************************   %%
%%                                                           %%
%% Chapter 4: Fig 4.24                                       %%
%%                                                           %%
%% Author: Frank Gross                                       %%
%% McGraw-Hill, 2005                                         %%
%% Date:  4/24/2005                                          %%
%%                                                           %%
%% This code creates Figure 4.24, a plot of the elevation    %%
%%     pattern for a circular array directed to th0 = 30 deg %%
%%     and ph0 = 0.                                          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:----------------------%%
% a - radius of circular array                                %
% N - number of array elements                                %
% pinc - phase increments between adjacent elements           %
% th - angle (rad)                                            %
% th0 - elevation angle (rad)                                 %
% ph0 - azimuthal angle (rad)                                 %
% AF - array factor of N element array                        %
%%-----------------------------------------------------------%%

%%----- Given Values -----%%

a = 1; N = 10; pinc = 2*pi/N; 

th = -pi/2:.01:pi/2; th0 = pi/6; ph0 = 0;

%%----- Determine Array Factor for Circular Array -----%%

AF = 0;
for n = 1:N
    AF = AF + exp(-1j*2*pi*a*(sin(th)*cos(ph0-(n-1)*pinc)-sin(th0)*cos(ph0-(n-1)*pinc)));
end

%%----- Plot Results -----%%

figure(1), plot(th*180/pi,abs(AF/max(AF)),'k')
xlabel('\theta (deg)'), ylabel('|AF|')
title('\bfBeamsteered Circular Array of N = 10 elements & a = 1\lambda')
axis([-90 90 0 1]), set(gca,'xTick',[-90:30:90])
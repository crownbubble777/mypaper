%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 3: Fig 3.6 a & b                                %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/3/2004                                         %%
%%                                                         %%
%% This code creates Fig 3.6, a normalized rectangular and %%  
%%     polar plot of one principle plane for a 3-D field   %%
%%     pattern given by the array factor for an N element  %% 
%%     antenna array.                                      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% N - number of antenna elements in array                   %
% d - separation distance of antenna elements               %
% theta - angle (rad)                                       %
% AF - array factor for uniform linear antenna array        %
%%---------------------------------------------------------%%

%%--------------------- Given Values ----------------------%%

N = 12;
d = 0.25;
theta = -pi/2:.01:pi/2;  % array factors are typically plotted 
                         %    over this range.

%%------------ Define Array Factor of antenna array -------%%

AF = abs(sin(N*pi*d*sin(theta))./(N*(pi*d*sin(theta))));

%%--------------------- Plot Results ----------------------%%

figure

% Rectangular Plot  

subplot(211)
plot(theta*180/pi,AF,'k')
title('\bf\itFigure 3.6a: Rectangular Field Pattern Plot vs. \theta')
xlabel('\theta (deg)')
ylabel('Field Pattern')
axis([-90 90 0 1])
grid on

% Polar Plot

subplot(212)
polar(theta,AF,'k')
title('\bf\itFigure 3.6b: Polar Field Pattern Plot')
view(90,-90)
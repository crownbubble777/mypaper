%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                           %%
%%  ******************************************************   %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *   %%
%%  ******************************************************   %%
%%                                                           %%
%% Chapter 8: Ex 8.5                                         %%
%%                                                           %%
%% Author: Frank Gross                                       %%
%% McGraw-Hill, 2005                                         %%
%% Date:  3/05/2005                                          %%
%%                                                           %%
%% This code produces Figure 8.11, determines the weights    %%
%%     for directing the main beam of an N = 5, d = 0.5 ULA  %%
%%     towards a desired user at tho = 30 deg and nulling    %%
%%     an interferer at -10 deg using the Minimum Variance   %%
%%     method.  The resulting weighted array factor pattern  %%
%%     is plotted vs. arrival angle.                         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:----------------------%%
% M - # of elements in array                                  %
% d - element spacing in wavelengths                          %
% theta - arrival angle of desired users and interferers (rad)%
% ang - theta in deg                                          %
% th0 - desired user AOA (deg)                                %
% th1 - interferer AOA (deg)                                  %
% a0,a1 - steering vectors of desired user and interferer     %
% Rnn - noise correlation matrix                              %
% Rii - interferer correlation matrix                         %
% Ruu - total undesired signal correlation matrix             %
% w - weights of ULA determined using Min Variance method     %
% th - range of AOA's (rad)                                   %
% y - weighted array output                                   %
%%-----------------------------------------------------------%%

%%----- Givens -----%%

M = 5; d = 0.5; sig2 = 0.001;

theta = -pi/2:.001:pi/2; ang = theta*180/pi;

th0 = 30*pi/180; th1 = -10*pi/180;

n = 1:M;
a0 = exp(1j*2*pi*(n-1)*d*sin(th0)).'; 
a1 = exp(1j*2*pi*(n-1)*d*sin(th1)).';

Rii = a1*a1';             % interferer 1 correlation matrix  
Rnn = sig2*eye(M);        % noise correlation matrix       
Ruu = Rii + Rnn;            % total undesired signal correlation matrix

w = inv(Ruu)*a0./(a0'*inv(Ruu)*a0);           % calculated weight vector

for j = 1:length(theta)
    th = theta(j);
    aa = exp(1j*2*pi*(n-1)*d*sin(th)).'; 
    y(j) = w'*aa;
end

figure(1), plot(ang,abs(y)/max(abs(y)),'k')
xlabel('\theta'), ylabel('|AF(\theta)|')
title('\bfFigure 8.11 - Minimum Variance Pattern for 5 Element Array')
axis([-90 90 0 1])
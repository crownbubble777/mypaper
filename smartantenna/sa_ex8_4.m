%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                           %%
%%  ******************************************************   %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *   %%
%%  ******************************************************   %%
%%                                                           %%
%% Chapter 8: Ex 8.4                                         %%
%%                                                           %%
%% Author: Frank Gross                                       %%
%% McGraw-Hill, 2005                                         %%
%% Date:  3/05/2005                                          %%
%%                                                           %%
%% This code produces Figure 8.10, determines the weights for%%
%%     directing the main beam of an N = 5, d = 0.5 ULA      %%
%%     towards a desired user at tho = 30 deg using the      %%
%%     Maximum Likelihood method.  The resulting weighted    %% 
%%     array factor pattern is plotted vs. arrival angle.    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:----------------------%%
% M - # of elements in array                                  %
% d - element spacing in wavelengths                          %
% theta - arrival angle of desired users and interferers (rad)%
% ang - theta in deg                                          %
% th0 - desired user AOA (deg)                                %
% a0 - steering vector of desired user                        %
% A - matrix of interferer steering vectors                   %
% Rnn - noise correlation matrix                              %
% w - weights of ULA determined using Max Likelihood method   %
% th - range of AOA's (rad)                                   %
% y - weighted array output                                   %
%%-----------------------------------------------------------%%

%%----- Given Values -----%%

M = 5 ; d =.5; sig2 = .001;

theta = -pi/2:.001:pi/2; ang = theta*180/pi;

th0 = 30*pi/180;

%%----- Determine steering vector for desired user -----%%

n = 1:M;
a0 = exp(1j*2*pi*(n-1)*d*sin(th0)).';

%%----- Determine noise correlation matrix -----%%

Rnn = sig2*eye(M);        

%%----- Determine weights using Maximum Likelihood method -----%%

w = inv(Rnn)*a0./(a0'*inv(Rnn)*a0);

for j = 1:length(theta)
    th = theta(j);
    aa = exp(1j*2*pi*(n-1)*d*sin(th));  
    y(j) = w'*aa.';
end

%%----- Plot Results -----%%

figure(1), plot(ang,abs(y)/max(abs(y)),'k')
xlabel('\theta'), ylabel('|AF(\theta)|')
title('\bfFigure 8.10 - Maximum Likelihood Pattern for 5 Element Array')
axis([-90 90 0 1])
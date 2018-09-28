%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                           %%
%%  ******************************************************   %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *   %%
%%  ******************************************************   %%
%%                                                           %%
%% Chapter 8: Ex 8.7                                         %%
%%                                                           %%
%% Author: Frank Gross                                       %%
%% McGraw-Hill, 2005                                         %%
%% Date:  3/05/2005                                          %%
%%                                                           %%
%% This code produces Figure 8.16, determines the weights    %%
%%     for directing the main beam of an N = 8, d = 0.5 ULA  %%
%%     towards a desired user at tho = 30 deg and nulling an %%
%%     interferer at -60 deg using the SMI algorithm.  The   %%
%%     resulting  weighted array factor pattern is plotted   %%
%%     vs. AOA.                                              %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:----------------------%%
% N - # of elements in array                                  %
% d - element spacing in wavelengths                          %
% sig2 - noise variance                                       %
% Ns - number of data samples                                 %
% Nb - block length                                           %
% theta - arrival angle of desired users and interferers (rad)%
% ang - theta in deg                                          %
% thetaS - desired user AOA (deg)                             %
% thetaI - interferer AOA (deg)                               %
% T - period of desired signal                                %
% t - time axis for desired signal                            %
% S - desired signal                                          %
% I - interfering signal                                      %
% vS,vI - steering vectors of desired user and interferers    %
% n - noise received by array with variance sig2              %
% x - total received signal                                   %
% Rxx - total received signal covariance matrix               %
% r - cross correlation vector                                %
% w - weights of ULA determined using LMS algorithm           %
% x - total received signal                                   %
% y - array output                                            %
% e - error between array output and desired signal           %
% theta - range of AOA's (rad)                                %
% AF - weighted array output                                  %
%%-----------------------------------------------------------%%

%%----- Given Values -----%%

N = 8; d = .5; sig2 = .001;

Ns = 100;    
Nb =  30;      

thetaS = 30*pi/180; thetaI = -60*pi/180;

%%----- Desired Signal & Interferer -----%%

T = 1E-3; t = (1:Nb)*T/Ns;

S = cos(2*pi*t/T);

I = randn(1,Nb);

%%----- Create Array Factors for each user's signal for linear array -----%%

i = 1:N;
vS = exp(1j*(i-1)*2*pi*d*sin(thetaS));
vI = exp(1j*(i-1)*2*pi*d*sin(thetaI));

%%----- Solve for Weights using SMI -----%%

n = randn(N,Nb)*sqrt(sig2);

x = vS.'*S + vI.'*I + n;
Rxx = x*x'/Nb;
r = x*S'/Nb;
w = inv(Rxx)*r;
w = w/w(1);  

%%----- Plot Results -----%%

theta = -pi/2:.01:pi/2;
AF = 0;
for i = 1:N
    AF = AF + w(i)'*exp(j*(i-1)*2*pi*d*sin(theta));
end

figure(1), plot(theta*180/pi,abs(AF)/max(abs(AF)),'k')
xlabel('AOA (deg)'), ylabel('|AF_n|')
title('\bfFigure 6.16 - Weighted SMI Array Pattern')
axis([-90 90 0 1.1]), grid on
set(gca,'xtick',[-90 -60 -30 0 30 60 90])
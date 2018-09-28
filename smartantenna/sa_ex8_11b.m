%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                           %%
%%  ******************************************************   %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *   %%
%%  ******************************************************   %%
%%                                                           %%
%% Chapter 8: Ex 8.11                                        %%
%%                                                           %%
%% Author: Frank Gross                                       %%
%% McGraw-Hill, 2005                                         %%
%% Date:  3/05/2005                                          %%
%%                                                           %%
%% This code produces Figure 8.21, a plot of the beampattern %%
%%     for a N = 8 ULA with d = 0.5, where the weights were  %%
%%     determined using the LS-CMA algorithm.                %%
%%                                                           %%
%% Note: This code contains one way in which multipath       %%
%%       components were created to produce dispersion.      %%
%%       Ex. 8.11a provides another.  This particular case   %%
%%       uses zero padding to represent time delays.         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

%%------------------- Define Variables:----------------------%%
% N - # of elements in array                                  %
% d - element spacing in wavelengths                          %
% n - number of iteration to be performed                     %
% K - block length                                            %
% sig2 - zero mean Gaussian noise variance                    %
% Nchips - number of chips in binary sequence                 %
% nsamples - number of samples per chip                       %
% b - binary sequence                                         %
% b1 - direct path binary sequence                            %
% b2 - time delayed multipath component of binary seq.        %
% S - desired signal                                          %
% I - interfering signal                                      %
% thetaS - desired user AOA (deg)                             %
% theta1, theta2 - interferer AOA (deg)                       %
% vS,v1 - steering vectors of desired user and interferers    %
% x - total received signal                                   %
% Rnn - noise covariance matrix                               %
% Rxx - total received signal covariance matrix               %
% Rinv - inverse of Rxx                                       %
% w - weights of ULA determined using LMS algorithm           %
% y - array output                                            %
% theta - range of AOA's (rad)                                %
% AF - weighted array output                                  %
%%-----------------------------------------------------------%%

%%----- Given Values -----%%

N = 8; d = .5; sig2 = .01; n = 132;    % total number of iterations

Nchips = 32; nsamples = 4;

%%---- Create Binary Sequence -----%%

btemp = sign(randn(1,Nchips));
b = [];
for i = 1:length(btemp),
	b = [b,btemp(i)*ones(1,nsamples)];
end

b1 = [b 0 0 0 0]; b2 = .3*[0 0 b 0 0];
K = length(b1);

%%----- Desired Signal & Interferer definition-----%%

S = b1; thetaS = 45*pi/180;
I1 = b2; theta1 = -30*pi/180;

%%-----Calculate Array Steering Vectors -----%%

ii = 1:N;
vS = exp(1j*(ii-1)*2*pi*d*sin(thetaS));
v1 = exp(1j*(ii-1)*2*pi*d*sin(theta1));

x = vS.'*S + v1.'*I1;

%%----- Solve for weights using static LS-CMA -----%%

Rnn = sig2*eye(N); Rxx = x*x'/K + Rnn; Rinv = inv(Rxx);

w = [1;zeros(N-1,1)];  % Typically the initial weight is set to this
                       % corresponding to an omnidirectional antenna 
for jj = 1:3
    r = w'*x;
    r = r./abs(r+eps);
    w = Rinv*(x*r'/K);
end

w = w/w(1);

%%----- Plot Results -----%%

theta = -pi/2:.01:pi/2;
AF = zeros(1,length(theta));

for i = 1:N
    AF = AF + w(i)'*exp(j*(i-1)*2*pi*d*sin(theta));
end

figure(1), plot(theta*180/pi,abs(AF)/max(abs(AF)),'k')
xlabel('AOA (deg)'), ylabel('|AF_n|')
title('\bfFigure 8.21 - Static LS-CMA beampattern vs. AOA')
axis([-90 90 0 1.1]), grid on
set(gca,'xtick',[-90 -60 -30 0 30 60 90])
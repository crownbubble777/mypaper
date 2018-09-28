%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                           %%
%%  ******************************************************   %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *   %%
%%  ******************************************************   %%
%%                                                           %%
%% Chapter 8: Ex 8.12                                        %%
%%                                                           %%
%% Author: Frank Gross                                       %%
%% McGraw-Hill, 2005                                         %%
%% Date:  3/05/2005                                          %%
%%                                                           %%
%% This code produces Figure 8.22, a plot of the beampattern %%
%%     for a N = 8 ULA with d = 0.5, where the weights were  %%
%%     determined using the LS-CMA algorithm.                %%
%%                                                           %%
%% Note: This code contains one way in which multipath       %%
%%       components were created to produce dispersion.      %%
%%       Ex. 8.12a provides another.  This particular case   %%
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
% b2, b3 - time delayed multipath component of binary seq.    %
% S - desired signal                                          %
% I - interfering signal                                      %
% thetaS - desired user AOA (deg)                             %
% theta1, theta2 - interferer AOA (deg)                       %
% vS,v1,v2 - steering vectors of desired user and interferers %
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

N = 8; d = .5; n = 5; K = 22; sig2 = .01;

%%---- Create Binary Sequence -----%%

Nchips = 32; nsamples = 4;

btemp = sign(randn(1,Nchips));
b = [];
for i = 1:length(btemp),
	b = [b,btemp(i)*ones(1,nsamples)];
end

b1 = [b 0 0 0 0]; b2 = .3*[0 0 b 0 0]; b3 = .1*[0 0 0 0 b];

thetaS = 45*pi/180;
theta1 = -30*pi/180;
theta2 = 0*pi/180;

%%-----Calculate Array Steering Vectors -----%%

ii = 1:N;
vS = exp(1j*(ii-1)*2*pi*d*sin(thetaS));
v1 = exp(1j*(ii-1)*2*pi*d*sin(theta1));
v2 = exp(1j*(ii-1)*2*pi*d*sin(theta2));

%%----- Calculate the weights using dynamic LS-CMA -----%%

w = zeros(N,n); w(1,1) = 1; ww = w(:,1);

Rnn = sig2*eye(N);

for jj = 1:n
    S = b1(jj:K-1+jj); I1 = .3*b2(jj:K-1+jj); I2 = .1*b3(jj:K-1+jj);
    x = vS.'*S+v1.'*I1+v2.'*I2;
    Rxx = x*x'/K + Rnn; Rinv = inv(Rxx);
    r = ww'*x;
    r = r./abs(r);
    w(:,jj)=Rinv*(x*r'/K);
    ww = w(:,jj);
end

ww = ww/real(ww(1));

%%----- Plot Results -----%%

theta = -pi/2:.01:pi/2;
AF = 0;

for ii = 1:N
    AF = AF + ww(ii)'*exp(1j*(ii-1)*2*pi*d*sin(theta));
end

figure(1), plot(theta*180/pi,abs(AF)/max(abs(AF)),'k')
xlabel('AOA (deg)'), ylabel('|AF_n|')
title('\bfFigure 8.22 - Dynamic LS-CMA beampattern vs. AOA')
axis([-90 90 0 1.1]), grid on
set(gca,'xtick',[-90 -60 -30 0 30 60 90])
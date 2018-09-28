%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                           %%
%%  ******************************************************   %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *   %%
%%  ******************************************************   %%
%%                                                           %%
%% Chapter 8: Ex 8.10                                        %%
%%                                                           %%
%% Author: Frank Gross                                       %%
%% McGraw-Hill, 2005                                         %%
%% Date:  3/05/2005                                          %%
%%                                                           %%
%% This code produces Figure 8.20, a plot of the beampattern %%
%%     for a N = 8 ULA with d = 0.5, where the weights were  %%
%%     determined using the CM algorithm.                    %%
%%                                                           %%
%% Note: This code contains one way in which multipath       %%
%%       components were created to produce dispersion.      %%
%%       Ex. 8.10b provides another.                         %%
%%       This file produces the one presented in the book.   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:----------------------%%
% N - # of elements in array                                  %
% d - element spacing in wavelengths                          %
% K - block length                                            %
% mu - convergence parameter                                  %
% Nchips - number of chips in binary sequence                 %
% nsamples - number of samples per chip                       %
% T - period of binary sequence                               %
% tau - chip period                                           %
% num - total number of bits in sequence                      %
% t - time axis for binary sequence                           %
% b - binary sequence                                         %
% b1 - direct path binary sequence                            %
% b2, b3 - time delayed multipath component of binary seq.    %
% S - desired signal                                          %
% I - interfering signal                                      %
% thetaS - desired user AOA (deg)                             %
% theta1, theta2 - interferer AOA (deg)                       %
% vS,v1,v2 - steering vectors of desired user and interferers %
% x - total received signal                                   %
% w - weights of ULA determined using LMS algorithm           %
% y - array output                                            %
% theta - range of AOA's (rad)                                %
% AF - weighted array output                                  %
%%-----------------------------------------------------------%%

%%----- Given Values -----%%

N = 8; d = .5; K = 100; mu = 0.5;

%%---- Create Binary Sequence -----%%

Nchips = 32; nsamples = 4;

T = 32/3E6; tau = T/Nchips; num = Nchips*nsamples; t = (1:num)*T*1E6/num; tt = t(1:K);

btemp = sign(randn(1,Nchips));
b = [];
for i = 1:length(btemp),
	b = [b,btemp(i)*ones(1,nsamples)];
end

%%----- Time Delay Binary Sequence to create multipath component -----%%

b1 = b(1:100); b2 = .3*b(3:102); b3 = .1*b(6:105);

%%----- Plot Sequences -----%%

figure(1), subplot(221), plot(tt,b1,'k')
xlabel('t'), ylabel('amplitude')
axis([ 0 max(tt) -1.5 1.5])

subplot(222), plot(tt,b2,'k') 
xlabel('t'), ylabel('amplitude')
axis([ 0 max(tt) -1.5 1.5])

subplot(223), plot(tt,b3,'k')
xlabel('t'), ylabel('amplitude')
axis([ 0 max(tt) -1.5 1.5])

subplot(224), plot(tt,b1+b2+b3,'k')
xlabel('t'), ylabel('amplitude')
axis([ 0 max(tt) -1.5 1.5])

%%----- Desired Signal & Interferer definition-----%%

S = b1; thetaS = 45*pi/180;                       % exp(1j*rand*2*pi) characterizes a random phase shift from ground
I1 = b2*exp(1j*rand*2*pi); theta1 = -30*pi/180;   % reflection in multipath component.
I2 = b3*exp(1j*rand*2*pi); theta2 = 0*pi/180;

%%-----Calculate Array Steering Vectors -----%%

ii = 1:N;
vS = exp(1j*(ii-1)*2*pi*d*sin(thetaS));
v1 = exp(1j*(ii-1)*2*pi*d*sin(theta1));
v2 = exp(1j*(ii-1)*2*pi*d*sin(theta2));

%%----- Determine total received signal -----%%

x = vS.'*S+v1.'*I1+v2.'*I2;

%%----- Determine weights using CMA -----%%

w = zeros(N,K); w(1,1) = 1;

for k = 1:K
    y(k) = w(:,k)'*x(:,k);
    w(:,k+1) = w(:,k) + mu*conj((1-1/abs(y(k)))*y(k))*x(:,k);    
end
ww = w(:,K);
ww = ww/abs(ww(1));

%%----- Plot Results -----%%

theta = -pi/2:.01:pi/2;
AF = 0;

for i = 1:N
    AF = AF + ww(i)'*exp(j*(i-1)*2*pi*d*sin(theta));
end

figure(2), plot(theta*180/pi,abs(AF)/max(abs(AF)),'k')
xlabel('AOA (deg)'), ylabel('|AF_n|')
axis([-90 90 0 1.1]), grid on
set(gca,'xtick',[-90 -60 -30 0 30 60 90])
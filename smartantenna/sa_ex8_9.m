%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                           %%
%%  ******************************************************   %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *   %%
%%  ******************************************************   %%
%%                                                           %%
%% Chapter 8: Ex 8.9                                         %%
%%                                                           %%
%% Author: Frank Gross                                       %%
%% McGraw-Hill, 2005                                         %%
%% Date:  3/05/2005                                          %%
%%                                                           %%
%% This code produces Figure 8.18, a plot of the beampattern %%
%%     for a N = 8 ULA with d = 0.5, where the weights were  %%
%%     determined using the RLS algorithm with alpha = .9.   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:----------------------%%
% N - # of elements in array                                  %
% d - element spacing in wavelengths                          %
% sig2 - noise variance                                       %
% alpha - forgetting factor                                   %
% thetaS - desired user AOA (deg)                             %
% thetaI - interferer AOA (deg)                               %
% T - period of desired signal                                %
% t - time axis for desired signal                            %
% S - desired signal                                          %
% I - interfering signal                                      %
% vS,vI - steering vectors of desired user and interferers    %
% x - total received signal                                   %
% n - noise received by array                                 %
% Rnn - noise covariance matrix                               %
% Rxx - total received signal correlation matrix              %
% Rinv - inverse of total received signal correlation matrix  %
% alinv - inverse of forgetting factor, alpha                 %
% mu - convergence parameter                                  %
% w - weights of ULA determined using LMS algorithm           %
% theta - range of AOA's (rad)                                %
% AF - weighted array output                                  %
%%-----------------------------------------------------------%%

randn('state',0)

%%----- Givens -----%%

N = 8; d = .5; sig2 = .01; alpha = .9; K = 50;

thetaS = 30*pi/180; thetaI = -60*pi/180;

%----- Desired Signal & Interferer definition-----%

T = 1E-3; t = (0:(K-1))*T/(K-1);

S = cos(2*pi*t/T);

I = sin(pi*t/T);

%%----- Create steering vectors for each user's signal for linear array -----%%

i = 1:N;
vS = exp(1j*(i-1)*2*pi*d*sin(thetaS));
vI = exp(1j*(i-1)*2*pi*d*sin(thetaI));

%%----- Create total received signal and noise -----%%

x = vS.'*S + vI.'*I;	

n = randn(N,K)*sqrt(sig2); 

%%----- Calculate covariance matrices -----%%

Rnn = n*n'/K;
Rxx = x(:,1)*x(:,1)' + Rnn;
Rinv = inv(Rxx);
alinv = 1/alpha;

%%----- Solve for Weights using RLS -----%%

w = zeros(N,K);

for jj = 2:K
    Rxx = alpha*Rxx+x(:,jj)*x(:,jj)';
    Rinv = alinv*Rinv - alinv^2*Rinv*x(:,jj)*x(:,jj)'*Rinv./(1+alinv*x(:,jj)'*Rinv*x(:,jj));
    g = Rinv*x(:,jj);
    w(:,jj) = w(:,jj-1)+g*[S(jj)-x(:,jj)'*w(:,jj-1)];
end

%%----- Plot Results -----%%

ww = w(:,K); ww = ww/ww(1);

theta = -pi/2:.01:pi/2;
AF = 0; 

for i = 1:N
    AF = AF + ww(i)'*exp(1j*(i-1)*2*pi*d*sin(theta));
end
figure(1), plot(theta*180/pi,abs(AF)/max(abs(AF)),'k')
xlabel('AOA (deg)'), ylabel('|AF_n|')
title('\bfFigure 8.18 - RLS Array Pattern')
axis([-90 90 0 1]), grid on
set(gca,'xtick',[-90 -60 -30 0 30 60 90])
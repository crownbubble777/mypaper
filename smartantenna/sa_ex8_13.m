%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                           %%
%%  ******************************************************   %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *   %%
%%  ******************************************************   %%
%%                                                           %%
%% Chapter 8: Ex 8.13                                        %%
%%                                                           %%
%% Author: Frank Gross                                       %%
%% McGraw-Hill, 2005                                         %%
%% Date:  3/05/2005                                          %%
%%                                                           %%
%% This code produces Figure 8.24, a plot of the beampattern %%
%%     for a N = 8 ULA with d = 0.5, where the weights were  %%
%%     determined using the Conjugate Gradient method.       %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

%%------------------- Define Variables:----------------------%%
% N - # of elements in array                                  %
% d - element spacing in wavelengths                          %
% K - total number of data samples                            %
% sig2 - zero mean Gaussian noise variance                    %
% T - period of desired user's signal                         %
% t - time range for desired user's signal                    %
% S - desired signal                                          %
% I - interfering signal                                      %
% thetaS - desired user AOA (deg)                             %
% theta1, theta2 - interferer AOA (deg)                       %
% vS,v1,v2 - steering vectors of desired user and interferers %
% n - noise received by array                                 %
% x - total received signal                                   %
% A - KxM matrix of array snapshots                           %
% r - residuals                                               %
% D - direction vector which provides new direction           %
% nu - numerator of convergence parameter mu                  %
% den - denominator of convergence parameter mu               %
% mu - convergence paramteter                                 %
% rit - storage variable for residuals at each iteration      %
% alpha - parameter that minimizes the gradient of cost fcn.  %
% w - weights of ULA determined using LMS algorithm           %
% theta - range of AOA's (rad)                                %
% AF - weighted array output                                  %
%%-----------------------------------------------------------%%

%%----- Givens -----%% 

N = 8; d = .5; sig2 = .001; K = 20;

%----- Desired Signal & Interferer -----%

T = 1E-3; t = [1:K]*T/K;

S = cos(pi*t/T); thetaS = 45*pi/180;
I1 = randn(1,K); theta1 = -30*pi/180;
I2 = randn(1,K); theta2 = 0*pi/180;

%%-----Calculate Array Steering Vectors -----%%

ij = 1:N;
vS = exp(1j*(ij-1)*2*pi*d*sin(thetaS));
v1 = exp(1j*(ij-1)*2*pi*d*sin(theta1));
v2 = exp(1j*(ij-1)*2*pi*d*sin(theta2));

n = sqrt(sig2)*randn(N,K);
x = vS.'*S + v1.'*I1 + v2.'*I2 + n;

%%----- Calculate the weights using dynamic CGM -----%%

w = zeros(N,1);

A = x.'; r = S.' - A*w; rold = r; D = A'*r; rit = zeros(1,N);

for jj = 1:K
    nu = A'*r;  den = A*D;
    mu = real(nu'*nu)/real(den'*den);

    w = w - mu*D;
    
    r = r + mu*A*D;
    
    den = A'*rold; nu = A'*r;
    alpha = real(nu'*nu)/real(den'*den);
    
    rold = r;
    
    D = A'*r - alpha*D;
    
    rit(jj) = r'*r; rit(jj) = norm(r);
end

w = w/abs(w(1));

%%----- Plot Results -----%%

figure(1), plot(1:K,rit,'k')
xlabel('Iteration no.'), ylabel('||r||')
title('\bfFigure 8.24 - Norm of the Residuals for Each Iteration')
axis([1 K 0 max(rit)])

theta = -pi/2:.01:pi/2;
AF = 0;
for ii = 1:N
    AF = AF + w(ii)*exp(1j*(ii-1)*pi*sin(theta));
end

figure(2), plot(theta*180/pi,abs(AF)/max(abs(AF)),'k')
xlabel('AOA (deg)'), ylabel('|AF|')
title('\bfFigure 8.25 - Conjugate Gradient Method Beampattern vs. AOA') 
axis([-90 90 0 1.1])
set(gca,'xtick',[-90 -60 -30 0 30 60 90])
grid on
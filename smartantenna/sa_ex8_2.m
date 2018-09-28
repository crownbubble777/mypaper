%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                           %%
%%  ******************************************************   %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *   %%
%%  ******************************************************   %%
%%                                                           %%
%% Chapter 8: Ex 8.2                                         %%
%%                                                           %%
%% Author: Frank Gross                                       %%
%% McGraw-Hill, 2005                                         %%
%% Date:  3/05/2005                                          %%
%%                                                           %%
%% This code produces Figure 8.5, determines the weights for %%
%%     directing the main beam of an N = 3, d = 0.5 ULA      %%
%%     towards a desired user at tho = 30 deg and nulling    %%
%%     interferers at -30, 45 deg using the Max SIR method.  %%
%%     The resulting weighted array factor pattern is plotted%%
%%     vs. arrival angle.                                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:----------------------%%
% M - # of elements in array                                  %
% d - element spacing in wavelengths                          %
% theta - arrival angle of desired users and interferers (rad)%
% ang - theta in deg                                          %
% th0 - desired user AOA (deg)                                %
% th1, th2 - interferer AOA (deg)                             %
% a0,a1,a2 - steering vectors of desired user and interferers %
% A - matrix of interferer steering vectors                   %
% Rss - signal correlation matrix                             %
% Rnn - noise correlation matrix                              %
% Rii - interferer correlation matrix                         %
% Ruu - total undesired signal correlation matrix             %
% R - hermetian matrix                                        %
% Ev,v - eigenvectors and values for R                        %
% SIRmax - maximum signal to interference ratio value         %
% w - weights of ULA determined using Max SIR method          %
% th - range of AOA's (rad)                                   %
% y - weighted array output                                   %
%%-----------------------------------------------------------%%

%%----- Given Values -----%%

M = 3; d = 0.5; sig2 = .001;

theta = -pi/2:.01:pi/2; ang = theta*180/pi;

th0 = pi/6; th1 = -pi/6; th2 = pi/4;

%%----- Determine steering vectors and matrix of steering vectors -----%%

n = 1:M;
a0 = exp(1j*2*pi*(n-1)*d*sin(th0)).'; 
a1 = exp(1j*2*pi*(n-1)*d*sin(th1)).'; 
a2 = exp(1j*2*pi*(n-1)*d*sin(th2)).'; 
A = [a1 a2];

%%----- Determine Correlation Matrices -----%%

Rss = a0*a0';
Rnn = sig2*eye(M);
Rii = A*A';       
Ruu = Rii + Rnn;           % total undesired signal correlation matrix
R = inv(Ruu)*Rss;

%%------ Peform Eigenvalue decomposition for R -----%

[Ev,v] = eig(R); [Y,Index] = sort(diag(v));   % sorts the eigenvalues from least to greatest

SIRmax = max(Y);

%%----- Determine weights using max SIR method -----%%

w = inv(Ruu)*a0/SIRmax;

for j = 1:length(theta)
    th = theta(j);
    aa = exp(1j*2*pi*(n-1)*d*sin(th)).'; 
    y(j) = w'*aa;
end

%%----- Plot Results -----%%

figure(1), plot(ang,abs(y)/max(abs(y)),'k')
xlabel('\theta'), ylabel('|AF(\theta)|')
title('\bfFigure 8.5 - Maximum Signal-to-Interference Ratio Pattern')
axis([-90 90 0 1]) 

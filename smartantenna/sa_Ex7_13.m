%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                          %%
%%  ******************************************************  %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *  %%
%%  ******************************************************  %%
%%                                                          %%
%% Chapter 7: Ex 7.13                                       %%
%%                                                          %%
%% Author: Frank Gross                                      %%
%% McGraw-Hill, 2005                                        %%
%% Date:  1/26/2004                                         %%
%%                                                          %%
%% This code creates Figures 7.10 & 7.11, a plot of the     %%
%%     roots determined by the Root-Music AOA estimate in   %%
%%     cartesian coordinates and a plot of a MUSIC          %%
%%     Pseudospectrum for theta1= -2 & theta2 = 4. Use      %%
%%     time averages instead of expected values by assuming %%
%%     ergodicity of the mean and ergodicity of the         %%
%%     correlation.                                         %% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:---------------------%%
% M - # of elements in array                                 %
% sig2 - noise variance                                      %
% D - number of signals                                      %
% th1, th2 - angles of arrival                               %
% a1, a2, a - array steering vectors                         %
% A - Steering vector matrix                                 %
% K - Length of time samples                                 %
% Rss - Source correlation matrix                            %
% Rnn - noise correlation matrix                             %
% Rns - noise/signal correlation matrix                      %
% Rsn - signal/noise correlation matrix                      %
% Rxx - Array correlation matrix                             %
% V,Dia - eigen vectors, V and eigen values, D of Rxx        %
% EN - Noise subspace matrix                                 %
% P - MUSIC Psuedospectra                                    % 
% C - hermetian matrix composed of noise subspace EN         %
% cc - coefficients of Root-Music polynomial                 %
% rts - roots of Root-Music polynomial                       %
% angs - angles associated with roots of Root-Music Poly.    %
%%----------------------------------------------------------%%

%%----- Given Values -----%%

M = 4; sig2 = .3; D = 2;  % number of signals

th1 = -4*pi/180; th2 = 8*pi/180;  K = 300;  % K = length of time samples

%%----- Create array steering vectors, a1 & a2, steering matrix -----%%

a1 = [];  a2 = [];
i = 1:M;
a1 = exp(1j*(i-1)*pi*sin(th1));
a2 = exp(1j*(i-1)*pi*sin(th2));
A = [a1.' a2.'];

%%----- Calculate signal correlation matrix -----%%

s = sign(randn(D,K));      % Calculate the K time samples of the signals for the 
                           % two arriving directions
Rss = s*s'/K;              % source correlation matrix with uncorrelated signals

%%----- Calculate Correlation Matrices -----%%

n = sqrt(sig2)*randn(M,K); % Calculate the K time samples of the noise for the 6 array
                           % elements         
Rnn = (n*n')/K;            % Calculate the noise correlation matrix (which is no longer diagonal)
Rns = (n*s')/K;            % Calculate the noise/signal correlation matrix
Rsn = (s*n')/K;            % Calculate the signal/noise correlation matrix
Rxx = A*Rss*A' + A*Rsn + Rns*A' + Rnn;

%%----- Determine Noise Subspace Matrix -----%%

[V,Dia] = eig(Rxx); [Y,Index] = sort(diag(Dia));   % sorts the eigenvalues from least to greatest

EN = V(:,Index(1:M-D));    % Calculate the noise subspace matrix of eigenvectors
                           % using the sorting done in the previous line

%%----- Determine Music Psuedospectrum -----%%

for k = 1:180;
    th(k) = -pi/6 + pi*k/(3*180);
    clear a
    a=[];
    for jj = 1:M
       a = [a;exp(1j*(jj-1)*pi*sin(th(k)))];
    end
    P(k) = 1/abs(a'*EN*EN'*a); 
end

%%----- Calculate the matrix C -----%%

C = EN*EN';

%%----- Find the coefficients for the Root-MUSIC polynomial -----%%

for kk = -M+1:M-1
    cc(kk+M) = sum(diag(C,kk));
end

%%----- Display the roots of the Root-Music Polynomial -----%%

rts = roots(cc);   % find the roots of the 2*(M-1) polynomial

%%----- Display the angles of the Root-Music Polynomial -----%%

angs = -asin(angle(rts)/pi)*180/pi;    % find the angles associated with these root

%%----- Plot Results -----%%

figure(1), zplane(rts)
title('\bfFigure 7.10 - 6 Roots in Cartersian Coordinates for Root-Music AOA Estimate')

figure(2), plot(th*180/pi,P/max(P),'k',angs,abs(rts),'kX','markersize',10)
xlabel('Angle'), ylabel('|P(\theta)|')
title('\bfFigure 7.11 - Music Psuedospectrum and Roots Found Using Root-Music')
axis([-15 15 0 1.6]), grid on
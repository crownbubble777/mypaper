%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                          %%
%%  ******************************************************  %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *  %%
%%  ******************************************************  %%
%%                                                          %%
%% Chapter 7: Ex 7.12                                       %%
%%                                                          %%
%% Author: Frank Gross                                      %%
%% McGraw-Hill, 2005                                        %%
%% Date:  1/26/2004                                         %%
%%                                                          %%
%% This code creates Figure 7.9, plot of a MUSIC            %%
%%     Pseudospectrum for theta1= -5 & theta2 = 5. Use      %%
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
%%----------------------------------------------------------%%

%%----- Given Values -----%%

M = 6;  sig2 = 0.1; D = 2;

th1 = -5*pi/180;  th2 = 5*pi/180;  K = 100;

%%----- Create array steering vectors, a1 & a2 & array matrix, A -----%%

a1 = [];  a2 = [];
i = 1:M;
a1 = exp(1j*(i-1)*pi*sin(th1));
a2 = exp(1j*(i-1)*pi*sin(th2));
A = [a1.' a2.'];

%%----- Calculate signal correlation matrix -----%%

randn('state',0)

s = sign(randn(2,K));      % Calculate the K time samples of the signals for the 
                           % two arriving directions
Rss = s*s'/K;              % source correlation matrix with uncorrelated signals

%%----- Calculate noise correlation matrix, and remaining correlation matrices -----%%

randn('state',1)

n = sqrt(sig2)*randn(M,K); % calculate the K time samples of the noise for the 6 array
                           % elements
                    
Rnn = (n*n')/K;            % calculate the noise correlation matrix (which is no longer diagonal)
Rns = (n*s')/K;            % calculate the noise/signal correlation matrix
Rsn = (s*n')/K;            % calculate the signal/noise correlation matrix
Rxx = A*Rss*A' + A*Rsn + Rns*A' + Rnn;

%%----- Calculate the noise subspace matrix of eigen vectors, EN -----%%

[E,Dia] = eig(Rxx); [Y,Index] = sort(diag(Dia)); % sort eigenvalues from least to greatest

EN = E(:,Index(1:M-D));    % calculate the noise subspace matrix of eigenvectors
                           % using the sorting done in the previous line

%%----- Create Music Psuedospectrum -----%%

for k = 1:180;
    th(k) = -pi/6 + pi*k/(3*180);
    clear a
    a = [];
    for jj = 1:M
       a = [a; exp(1j*(jj-1)*pi*sin(th(k)))];
    end
    P(k)=1/abs(a'*EN*EN'*a); 
end

%%----- Plot Results -----%%

plot(th*180/pi,10*log10(P/max(P)),'k')
grid on
title(['\bfFigure 7.9 - MUSIC Psuedospectra for \theta = +/- 5^o'])
xlabel('Angle')
ylabel('|P(\theta)|')
axis([-30 30 -30 10])
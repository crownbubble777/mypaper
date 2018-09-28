%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                          %%
%%  ******************************************************  %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *  %%
%%  ******************************************************  %%
%%                                                          %%
%% Chapter 7: Ex 7.15                                       %%
%%                                                          %%
%% Author: Frank Gross                                      %%
%% McGraw-Hill, 2005                                        %%
%% Date:  1/26/2004                                         %%
%%                                                          %%
%% This code produces the results of Ex. 7.15 & determines  %%
%%    the angles of arrival estimated using the ESPIRIT AOA %%
%%    estimation technique.                                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:---------------------%%
% M - # of elements in array                                 %
% sig2 - noise variance                                      %
% D - number of signals                                      %
% th1, th2 - angles of arrival                               %
% a1, a2, a - array steering vectors                         %
% A - Steering vector matrix                                 %
% Rss - Source correlation matrix                            %
% Rns - noise/signal correlation matrix                      %
% Rsn - signal/noise correlation matrix                      %
% Rxx - Array correlation matrix                             %
% V,Dia - eigen vectors, V and eigen values, D of Rxx        %
% ES - Signal subspace matrix                                %
% E1, E2 - Subarray signal spaces formed from ES             %
% C - Matrix of subarray signal spaces, E1 & E2              %
% EC - matrix eigendecomposed components of C                %
% E11, E12 - quadrant components of EC                       %
% PSI - rotation operator                                    %
% Vp, Ep - eigenvectors and values of rotation operator      %
% angs - angles associated with roots of Min-Norm Polynomial %
%%----------------------------------------------------------%%

%%----- Given Values -----%

M = 4; sig2 = .1; D = 2;

th1 = -5*pi/180; th2 = 10*pi/180; 

%%----- Create array steering vectors, a1 & a2, steering matrix -----%%

a1 = []; a2 = [];
i = 1:M;
a1 = exp(1j*(i-1)*pi*sin(th1));
a2 = exp(1j*(i-1)*pi*sin(th2));
A = [a1.' a2.'];          

%%----- Calculate signal correlation matrix -----%%

K=300;                 % K = length of time samples
s=sign(randn(D,K));      % calculate the K time samples of the signals for the 
                                    % two arriving directions                
Rss =s*s'/K;      % source correlation matrix with uncorrelated signals

%%----- Calculate noise correlation matrix -----%%

n =sqrt(sig2)*randn(M,K);     % calculate the K time samples of the noise for the M array
                            % elements
Rnn =(n*n')/K;

%%----- Calculate remaining correlation matrices -----%%

Rns = (n*s')/K;           % calculate the noise/signal correlation matrix
Rsn =(s*n')/K;           %  calculate the signal/noise correlation matrix
Rxx =A*Rss*A'+A*Rsn+Rns*A'+Rnn;        % combine all to get the array correlation matrix

%%----- Determine eigen subspaced for Rxx -----%%

[V,Dia] = eig(Rxx); [Y,Index] = sort(diag(Dia));   % Sorts the eigenvalues from least to greatest

%%----- Determine Signal Subspace -----%%

ES = V(:,Index(M-D+1:M));       % Calculate the signal subspace matrix of eigenvectors
                                % using the sorting done in the previous line
          
%%----- Construct subarray signal spaces, E1 & E2 from signal subpspace -----%%

E1 = ES(1:M/2+1,:);              % Construct form the first K rows of ES (K = M/2+1)
E2 = ES(M/2:M,:);                % Construct from the last K rows of ES

%%----- Determine Matrix of subarray subspaces, C -----%%

C = [E1';E2']*[E1 E2];

%%---- Perform eigendecomposition of C to create matrix EC -----%%

[EC,tmp] = eig(C);               % Perform the eigendecomposition on the matrix C

E12 = EC(1:2,3:4);               % Construct the E12 submatrix
E22 = EC(3:4,3:4);               % Construct the E22 submatrix

%%----- Determine Rotation Operator -----%%

PSI = -E12*inv(E22);             % Estimate PSI, the rotation operator

[Vp,Ep] = eig(PSI);              % Find the eigenvalues and eigenvectors of rotation operator PSI
e = diag(Ep);

%%----- Solve for Arrival Angles -----%% 

angs = asin(angle(e)/pi)*180/pi  % Find the angles associated with the roots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                           %%
%%  ******************************************************   %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *   %%
%%  ******************************************************   %%
%%                                                           %%
%% Chapter 8: Ex 8.8                                         %%
%%                                                           %%
%% Author: Frank Gross                                       %%
%% McGraw-Hill, 2005                                         %%
%% Date:  3/05/2005                                          %%
%%                                                           %%
%% This code produces Figure 8.17, a plot of the trace of    %%
%%    the correlation matrix for both SMI and RLS given a    %%
%%    block length K.                                        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:----------------------%%
% N - # of elements in array                                  %
% d - element spacing in wavelengths                          %
% alpha - forgetting factor of RLS algorithm                  %
% K - block length                                            %
% th0 - desired user AOA (rad)                                %
% S - desired signal                                          %
% a0 - steering vector of desired user                        %
% n - noise received by array with variance sig2              %
% x - total received signal                                   %
% Rxx - total received signal covariance matrix               %
% Rxxtr - trace of covariance matrix                          %
%%-----------------------------------------------------------%%

%%----- Given Values -----%%

N = 4; d = .5; alpha = 1; K = 200;

th0 = 45*pi/180;

%%----- Create Desired user's signal -----%%

S = cos(2*pi*(0:K-1)/(K-1));

%%----- Determine steering vector for desired user -----%%

n = 1:N;
a0 = exp(1j*(n-1)*2*pi*d*sin(th0));

%%----- Create Total Received signal -----%%

x1 = a0.'*S(1:K);
x2 = a0.'*S(1);

%%----- Determine Covariance Matrix and Trace for SMI algorithm -----%%

Rxx1 = x1*x1'/K;
Rxxtr1 = real(trace(Rxx1))*ones(1,K);    
 
%%----- Determine Covariance Matrix and Trace for RLS algorithm -----%%

Rxx2 = x2*x2';

Rxxtr2(1) = real(trace(x2*x2'));
for k = 2:K
    x2 = a0.'*S(k);
    Rxx2 = alpha*(k-1)*Rxx2/k+x2*x2'/k;
    Rxxtr2(k) = real(trace(Rxx2));
end

%%----- Plot Results -----%%

figure;plot(1:K,Rxxtr2,'k',1:K,Rxxtr1,'k:')
xlabel('Iteration no.'), ylabel('trace(R_x_x)')
title('\bfFigure 8.17 - Trace of Correlation Matrix Using SMI and RLS')
axis([1 200 0 4])
legend('RLS','SMI for block K')
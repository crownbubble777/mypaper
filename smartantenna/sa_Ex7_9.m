%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 7: Ex 7.9                                       %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  1/26/2004                                        %%
%%                                                         %%
%% This code creates Figure 7.6, plot of a Pisarenko (PHD) %%
%%     Pseudospectrum for theta1= -5 & theta2 = 5          %% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% M - # of elements in array                                %
% sig2 - noise variance                                     %
% D - number of signals                                     %
% th1, th2 - angles of arrival                              %
% u1 - Cartesian basis vector                               %
% a1, a2, a - array steering vectors                        %
% A - Steering vector matrix                                %
% Rss - Source correlation matrix                           %
% Rxx - Array correlation matrix                            %
% V,D - eigen vectors, V and eigen values, D of Rxx         %
% N - noise subspace matrix                                 %
% P - Pisarenko (PHD) Psuedospectra                         %
%%---------------------------------------------------------%%

%%----- Given Values -----%%

M = 6;  sig2 = 0.1;

th1 = -5*pi/180;  th2 = 5*pi/180;

temp = zeros(1,M-1);  II = eye(M);  u1 = II(:,1);

%%----- Create array steering vectors, a1 & a2 -----%%

a1 = [];  a2 = [];
i = 1:M;
a1 = exp(1j*(i-1)*pi*sin(th1));
a2 = exp(1j*(i-1)*pi*sin(th2));

%%----- Create A, Rss, Rxx -----%%

A = [a1.' a2.'];  Rss = [1 0;0 1];  Rxx = A*Rss*A' + sig2*eye(M);  

%%----- Calculate the noise subspace matrix of smallest eigen vector, N -----%%

[V,D] = eig(Rxx);   N = V(:,1);

%%----- Create Pisarenko Psuedospectrum -----%%

for k = 1:180;
    th(k) = -pi/6+pi*k/(3*180);
    clear a
    a = [];
    for jj = 1:M
       a = [a exp(1j*(jj-1)*pi*sin(th(k)))];
    end
    P(k) = 1./abs(conj(a)*N).^2;  
end

%%----- Plot Results -----%%

plot(th*180/pi,10*log10(P/max(P)),'k')
grid on
title(['\bfFigure 7.6 - Pisarenko (PHD) Psuedospectra for \theta = +/- 5^o'])
xlabel('Angle')
ylabel('|P(\theta)|')
axis([-30 30 -30 10])
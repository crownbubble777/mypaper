%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 7: Ex 7.8                                       %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  1/26/2004                                        %%
%%                                                         %%
%% This code creates Figure 7.5, plot of a Maximum Entropy %%
%%     Pseudospectrum for theta1= -5 & theta2 = 5          %% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% M - # of elements in array                                %
% sig2 - noise variance                                     %
% th1, th2 - angles of arrival                              %
% a1, a2, a - array steering vectors                        %
% A - Steering vector matrix                                %
% Rss - Source correlation matrix                           %
% Rxx - Array correlation matrix                            %
% Sinv - inverse of array correlation matrix, Rxx           %
% P - Maximum Entropy Psuedospectra                         %
%%---------------------------------------------------------%%

%%----- Given Values -----%%

M = 6; sig2 = 0.1;

th1 = -5*pi/180; th2 = 5*pi/180;

%%----- Create steering vectors, a1 & a2 -----%%

a1 = [];  a2 = [];
i = 1:M;
a1 = exp(1j*(i-1)*pi*sin(th1));
a2 = exp(1j*(i-1)*pi*sin(th2));

%%----- Create A, Rss, Rxx -----%%

A = [a1.' a2.'];  Rss = [1 0;0 1]; Rxx = A*Rss*A' + sig2*eye(M);

Sinv = inv(Rxx);  c = Sinv(:,3);
for k = 1:180;
    th(k) = -pi/6 + pi*k/(3*180);
    clear a
    a = [];
    for jj = 1:M
       a = [a exp(1j*(jj-1)*pi*sin(th(k)))];
    end
    P(k)=1/abs(conj(a)*c*c'*a.');
end

%%----- Plot Results -----%%

plot(th*180/pi,10*log10(P/max(P)),'k')
title(['\bfFigure 7.5 - Maximum Entropy Psuedospectra for \theta = +/- 5^o'])
xlabel('Angle'), ylabel('|P(\theta)|')
axis([-30 30 -30 10]), grid on
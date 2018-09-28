%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 7: Ex 7.5                                       %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  1/26/2004                                        %%
%%                                                         %%
%% This code creates Figure 7.2, plot of a Bartlett        %%
%%     Pseudospectrum for theta1= -5, -10 & theta2 = 5, 10 %% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% M - # of elements in array                                %
% sig2 - noise variance                                     %
% th1, th2 - angles of arrival                              %
% a1, a2, a - array steering vectors                        %
% A - Steering vector matrix                                %
% Rss - Source correlation matrix                           %
% Rxx - Array correlation matrix                            %
% P - Bartlett Psuedospectra                                %
%%---------------------------------------------------------%%

%%----- Given Values -----%%

M = 6;  sig2 = 0.1;

disp(' ')
theta = input('  What are the AOA pairs for this plot in degrees? Enter 5 or 10:  ');
disp(' ')
if theta == 5
    th1 = -5*pi/180; th2 = 5*pi/180;
elseif theta == 10
    th1 = -10*pi/180; th2 = 10*pi/180;
end

%%----- Create array steering vectors, a1 & a2 -----%%

a1 = [];  a2 = [];
i = 1:M;
a1 = exp(1j*(i-1)*pi*sin(th1));
a2 = exp(1j*(i-1)*pi*sin(th2));

%%----- Create A, Rss & Rxx -----%%

A = [a1.' a2.'];  Rss = [1 0;0 1];   Rxx = A*Rss*A' + sig2*eye(M);

%%----- Create Bartlett Psuedospectrum -----%%

for k = 1:180;
   th(k) = -pi/2 + pi*k/180;
   clear a
   a = [];
   for jj = 1:M
      a = [a exp(1j*(jj-1)*pi*sin(th(k)))];
   end
   Pb(k) = real(a*Rxx*a');
end

Pb_dB = 10*log10(Pb/max(Pb));

%%----- Plot Results -----%%

plot(th*180/pi,Pb_dB,'k')
grid on
title(['\bfFigure 7.2 - Bartlett Psuedospectra for \theta = +/-',num2str(theta),'^o'])
xlabel('Angle')
ylabel('|P(\theta)| (dB)')
axis([-30 30 -30 10])
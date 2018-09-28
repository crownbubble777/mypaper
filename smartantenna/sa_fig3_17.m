%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 3: Fig 3.17                                     %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  1/26/2005                                        %%
%%                                                         %%
%% This code creates Figure 3.17, a plot of the maximum    %%
%%     directivity (dB) of a finite length dipole vs.      %%
%%     length (L/lambda)                                   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:-------------------------%%
% u - inline fcn to creat finite length dipole rad. intensity    %
% delta - negative limit of integration & integration step size  %
% x - limits of integration                                      %
% L - length of dipole in wavelengths                            %
% den - denominator of maximum directivity equation              %
% num - numerator of maximum directivity equation                %
% Do - maximum directivity of finite length dipole               %
%%--------------------------------------------------------------%%

%----- Initialize variables -----%

U = inline('((cos(pi*ll*cos(x))-cos(pi*ll))./sin(x)).^2.*sin(x)');

delta = .01;   x = delta:delta:pi;

%----- Create for loop to compute Do -----%

for i = 1:120
    ll = i/40;
    L(i) = ll;
    den = trapz(x,U(ll,x));
    num = 2*max(((cos(pi*ll*cos(x))-cos(pi*ll))./sin(x)).^2);
    temp2 = num/den;
    Do(i) = temp2;
end

%----- Plot Results -----%

figure
plot(L,10*log10(Do),'k'), grid on
title('\bfFigure 3.17: Maximum Directivity of Finite Length Dipole')
xlabel('L/\lambda')
ylabel('D_o  (dB)')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 5: Fig 5.7                                      %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  10/23/2004                                       %%
%%                                                         %%
%% This code creates Fig 5.7, an example of a Rician pdf   %%
%%     with variance 2 and A = 3.                          %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% x - x axis variable                                       %
% sig2 - variance of Rician pdf                             %
% A - Rician Factor                                         %
% p - Exponential pdf                                       %
%%---------------------------------------------------------%%

%%----- Given Values -----%%

x = 0:.01:10; sig2 = 2; A = 3;

%%----- Create Rician PDF -----%%

p = x.*exp(-(x.^2+A^2)/(2*sig2)).*besseli(0,x*A/sig2)/sig2;

%%----- Plot Results -----%%

figure(1), plot(x,p,'k')
xlabel('x'), ylabel('p(x)')
title('\bfFigure 5.7 - Rician PDF with \sigma^2 = 2 & A = 3')
axis([0 10 0 .4])
%set(gca,'xtick',[-10 20]), set(gca,'ytick',[-10 20])  % use this line to remove axes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 5: Fig 5.3                                      %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  10/23/2004                                       %%
%%                                                         %%
%% This code creates Fig 5.3, an example of a Gaussian pdf %%
%%     with variance 3 and mean 5.                         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% x - x axis variable                                       %
% sig2 - variance of Gaussian pdf                           %
% xo - mean of Gaussian pdf                                 %
% p - Gaussian pdf                                          %
%%---------------------------------------------------------%%

%%----- Given Values -----%%

x = 0:.01:10; sig2 = 3; xo = 5;

%%----- Create Gaussian PDF -----%%

p=exp(-(x-xo).^2/(2*sig2))/sqrt(2*pi*sig2);

%%----- Plot Results -----%%

figure(1), plot(x,p,'k')
xlabel('x'), ylabel('p(x)')
title('\bfFigure 5.3 - Gaussian PDF with \sigma^2 = 3 & x_o = 5')
axis([0 10 0 .3])
%set(gca,'xtick',[-10 20]), set(gca,'ytick',[-10 20])   % use this line to remove axes
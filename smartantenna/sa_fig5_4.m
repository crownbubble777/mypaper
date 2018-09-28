%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 5: Fig 5.4                                      %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  10/23/2004                                       %%
%%                                                         %%
%% This code creates Fig 5.4, an example of a Rayleigh pdf %%
%%     with variance 3.                                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% x - x axis variable                                       %
% sig2 - variance of Rayleigh pdf                           %
% p - Rayleigh pdf                                          %
%%---------------------------------------------------------%%

%%----- Given Values -----%

x = 0:.01:10; sig2 = 3;

%%----- Create Rayleigh PDF -----%%

p = exp(-x.^2/(2*sig2)).*x/sig2;

%%----- Plot Results -----%%

figure(1), plot(x,p,'k')
xlabel('x'), ylabel('p(x)')
title('\bfFigure 5.4 - Rayleigh PDF with \sigma^2 = 3')
axis([0 10 0 .4])
%set(gca,'xtick',[-10 20]), set(gca,'ytick',[-10 20])  % use this line to remove axes.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 5: Fig 5.6                                      %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  10/23/2004                                       %%
%%                                                         %%
%% This code creates Fig 5.6, an example of an Exponential %%
%%     pdf with standard deviation 2.                      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% x - x axis variable                                       %
% sig - standard deviation of Exponential pdf               %
% p - Exponential pdf                                       %
%%---------------------------------------------------------%%

%%----- Given Values -----%%

x = 0:.01:10; sig = 2;

%%----- Create Exponential PDF -----%%

p = exp(-x/sig)/sig;

%%----- Plot Results -----%%

figure(1), plot(x,p,'k')
xlabel('x'), ylabel('p(x)')
title('\bfFigure 5.6 - Exponential PDF with \sigma = 2')
axis([0 10 0 .5])
%set(gca,'xtick',[-10 20]), set(gca,'ytick',[-10 20])  % use this line to remove axes
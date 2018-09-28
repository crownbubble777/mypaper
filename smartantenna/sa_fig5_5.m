%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 5: Fig 5.5                                      %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  10/23/2004                                       %%
%%                                                         %%
%% This code creates Fig 5.5, an example of a Uniform pdf  %%
%%     with a = 3, b = 6.                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% x - x axis variable                                       %
% a - lower bound of Uniform pdf                            %
% b - upper bound of Uniform pdf                            %
% p - Uniform pdf                                           %
%%---------------------------------------------------------%%

%%----- Given Values -----%%

x = 0:.001:10; a = 3; b = 6;

%%----- Create Uniform PDF -----%%

p=(stepfun(x,a)-stepfun(x,b))/(b-a);

%%----- Plot Results -----%%

figure(1), plot(x,p,'k')
xlabel('x'), ylabel('p(x)')
title('\bfFigure 5.5 - Uniform PDF with a = 3, b = 6')
axis([0 10 0 .4])
%set(gca,'xtick',[-10 20]), set(gca,'ytick',[-10 20])   % use this line to remove axes
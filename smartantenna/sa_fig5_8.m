%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                          %%
%%  ******************************************************  %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *  %%
%%  ******************************************************  %%
%%                                                          %%
%% Chapter 5: Fig 5.8                                       %%
%%                                                          %%
%% Author: Frank Gross                                      %%
%% McGraw-Hill, 2005                                        %%
%% Date:  10/23/2004                                        %%
%%                                                          %%
%% This code creates Fig 5.8, an example of a Laplacian pdf %%
%%     with standard deviation 2.                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:---------------------%%
% x - x axis variable                                        %
% sig - standard deviation of Laplacian pdf                  %
% p - Laplacian pdf                                          %
%%----------------------------------------------------------%%

%%----- Given Values -----%

x = -10:.01:10; sig = 2;

%%----- Create Laplacian PDF -----%%

p=exp(-abs(x*sqrt(2)/sig))/(sqrt(2)*sig);

%%----- Plot Results -----%%

figure(1), plot(x,p,'k')
xlabel('x'), ylabel('p(x)')
title('\bfFigure 5.8 - Laplacian PDF with \sigma = 2')
axis([-10 10 0 .4])
%set(gca,'xtick',[-15 15]), set(gca,'ytick',[-15 15])   % use this line to remove axes
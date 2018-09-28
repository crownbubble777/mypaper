%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 6: Fig 6.31                                     %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/30/2004                                        %%
%%                                                         %%
%% This code creates Fig 6.31, a plot of a typical log -   %%
%%     normal PDF.                                         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% sig - standard deviation (dBm)                            %
% p - Power (dBm)                                           %
% p0 - Average signal level (dBm)                           %
% PDF - log-normal distribution                             %
%%---------------------------------------------------------%%

%%------------------ Given Values ------------------%%

sig = .4;   p = .01:.01:8;   po = 2;

%%------------ Determine Log-Normal PDF ------------%%

PDF = exp(-(log10(p/po)).^2/(2*sig^2))./(p*sig*sqrt(2*pi));

%%------------------ Plot Results -------------------%%

plot(p,PDF,'k')

title('\bfFig 6.31 - Typical Log-Normal Distribution','Fontweight','bold')
xlabel('Power, p')
ylabel('PDF  p(p)')

set(gca,'xtick',[0 1 2 3 4 5 6 7 8])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                           %%
%%  ******************************************************   %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *   %%
%%  ******************************************************   %%
%%                                                           %%
%% Chapter 2: Fig 2.1                                        %%
%%                                                           %%
%% Author: Frank Gross                                       %%
%% McGraw-Hill, 2005                                         %%
%% Date:  9/05/2005                                          %%
%%                                                           %%
%% This code produces Figure 2.1, a plot of the ratio between%%
%%     the attenuation and phase constant of the Helmholtz   %%
%%     wave equation for a range of frequencies.             %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:----------------------%%
% f - range of frequencies (Hz)                               %
% ab - ratio of alpha to beta given frequency f               %
%%-----------------------------------------------------------%%

f = .001:.001:1000;
ab = sqrt((sqrt(1+f.^2)-1)./(sqrt(1+f.^2)+1));

%%----- Plot Results -----%%

figure(1), semilogx(f,ab,'k',.01,1,'k--',100,1,'k--')
xlabel('\sigma/\omega\epsilon'), ylabel('\alpha / \beta')
title('\bfFigure 2.1 - Ratio of Attenuation Constant (\alpha) to Phase Constant (\beta)')

% Add text to plot

text(3E-3,.4,'Good Insulator','FontSize',10,'rotation',90)
text(300,.4,'Good conductor','FontSize',10,'rotation',90)

% Add line to plot

line([.01 .01],[0 1],'color','k','linestyle','--')
line([100 100],[0 1],'color','k','linestyle','--')
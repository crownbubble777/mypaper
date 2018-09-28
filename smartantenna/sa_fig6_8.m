%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 6: Fig 6.8                                      %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/29/2004                                        %%
%%                                                         %%
%% This code creates Fig 6.8, a plot of an Exponential PDF %%
%%     equal to the power of the envelope for a Rayleigh   %%
%%     distribution for two different average power values,%%
%%     po = 2 & 4 uW.                                      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%%------------------- Define Variables:--------------------%%
% po1, po2 - Average power of envelope                      %
% p - Power of envelope                                     %
% p1, p2 - Exponential PDF for power in envelope            %
%%---------------------------------------------------------%%

%%------------------ Given Values ------------------%%

po1 = 2;    po2 = 4;

p = 0:.01:6;

%%------- Determine Exponential Distributions ------%%

p1 = exp(-p/po1)/po1;    p2 = exp(-p/po2)/po2;

%%------------------ Plot Results ------------------%%

plot(p,p1,'k',p,p2,'k:')
axis([0 6 0 .5])

title('\bfFig 6.8 - Exponential PDF vs. Power for p_o_1 & p_o_2','Fontweight','bold')
xlabel('Power (\muW)')
ylabel('p(p)')

legend('p_o_1 = 2\muW','p_o_2 = 4\muW')
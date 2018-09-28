%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 6: Fig 6.6                                      %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/29/2004                                        %%
%%                                                         %%
%% This code creates Fig 6.6, a plot of a Rayleigh PDF for %%
%%     two different standard deviations, sigma = 1 & 2.   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%%------------------- Define Variables:--------------------%%
% sig1, sig2 - standard deviation                           %
% r - Envelope (mV)                                         %
% p_sig1 - Rayleigh Distribution for sig1                   %
% p_sig2 - Rayleigh Distribution for sig2                   %
%%---------------------------------------------------------%%

%%------------------ Given Values ------------------%%

sig1 = 1;   sig2 = 2;

r = 0:.01:6;

%%--------- Determine Rayleigh Distributions -------%%

p_sig1 = r.*exp(-r.^2/(2*sig1^2))/sig1^2;
p_sig2 = r.*exp(-r.^2/(2*sig2^2))/sig2^2;

%%------------------ Plot Results ------------------%%

plot(r,p_sig1,'k',r,p_sig2,'k:')
axis([0 6 0 1])

title('\bfFig 6.6 - Rayleigh PDF vs. Envelope for \sigma_1 & \sigma_2')
xlabel('Envelope r (mV)')
ylabel('p(r)')

legend('\sigma_1 = 0.001','\sigma_2 = 0.002')
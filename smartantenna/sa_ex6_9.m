%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 6: Ex. 6.9                                      %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/30/2004                                        %%
%%                                                         %%
%% This code creates Fig 6.33, a plot of both a channel    %%
%%     and equalizer frequency response.                   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% ft - x axis range variable                                %
% Hc - Channel frequency response                           %
% Heq - Equalizer frequency response                        %
%%---------------------------------------------------------%%

%%----- Givens -----%%

ft = 0:.01:1.5;

%%----- Determine Channel and Equalizer Frequency Responses -----%%

% Channel Response

Hc = .2+.3*exp(-1j*2*pi*ft);

% Equalizer Response (either line produces the same plot)

Heq=1./Hc;
%Heq = (.2+.3*exp(1j*2*pi*ft))./(.13+.12*cos(2*pi*ft));

%%----- Plot Results -----%%

figure(1), plot(ft,10*log10(abs(Hc)),'k',ft,10*log10(abs(Heq)),'k:')
xlabel('f\tau'), ylabel('|H_c(f\tau)|,    |H_e_q(f\tau)|  (dB)')
title('\bfFigure 6.33 - Channel and Equalizer Frequency Response')
legend('Channel','Equalizer',0)
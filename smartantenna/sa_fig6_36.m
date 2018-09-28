%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 6: Fig 6.36                                     %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/30/2004                                        %%
%%                                                         %%
%% This code creates Fig 6.36, a plot of a CDMA pn code    %%
%%     correlated with itself and time delayed.            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% Nchips - number of chips for pn sequence                  %
% nsamples - number of samples per chip                     %
% a - pn code                                               %
% CDMA - CDMA signal (sampled pn code)                      %
% R1 - correlated CDMA sequence with itself                 %
% R2 - correlated CDMA sequence with dissimilar sequence    %
%%---------------------------------------------------------%%

%%------------------ Given Values ------------------%%

Nchips = 32;    nsamples = 12;

%%---------------- Generate pn code -----------------%%

a = sign(randn(1,Nchips));

%%------- Sample codes nsamples times per chip ------%%

CDMA = [];

for i = 1:length(a),
	CDMA = [CDMA,a(i)*ones(1,nsamples)];
end

CDMA1 = [CDMA zeros(1,36)];
CDMA2 = [zeros(1,16) CDMA zeros(1,20)];

t = (0:length(CDMA1)-1)*2/(length(CDMA1)-1);

%%---- Correlate CDMA1 with itself and with CDMA2 ----%%

R1 = sum(CDMA1.*CDMA1);
R2 = sum(CDMA1.*CDMA2);

%%------------------ Plot Results -------------------%%

subplot(211)
plot (t,CDMA1,'k');

axis([0 2 -1.2 1.2])

title('\bfWaveform with 0 excess delay')
xlabel('time \muSec'), ylabel('Amplitude')

subplot(212)
plot(t,CDMA2,'k');

axis([0 2 -1.2 1.2])

title('\bfWaveform with 1.3\tau excess delay')
xlabel('time \muSec'), ylabel('Amplitude')
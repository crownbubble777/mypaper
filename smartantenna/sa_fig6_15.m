%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 6: Fig 6.15                                     %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/29/2004                                        %%
%%                                                         %%
%% This code creates Fig 6.15, a plot of the Doppler Power %%
%%     Density Spectrum vs. Frequency for -fd < f < fd.    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% sig2 - Average signal power                               %
% fd - Doppler Frequency (Hz)                               %
% f - Frequency (Hz)                                        %
% Sd - Doppler Power Spectrum                               %
%%---------------------------------------------------------%%

%%------------------ Given Values ------------------%%

sig2 = pi;  fd = 1; f = (-fd+0.005):0.001:(fd-0.005);

%%-------- Determine Doppler Power Spectrum --------%%

Sd = sig2./(pi*fd*sqrt(1-(f/fd).^2));   Sd = Sd*4/max(Sd);

%%------------------ Plot Results ------------------%%

plot(f,Sd,'k:')

title('\bfFig 6.15 - Doppler Power Density Spectrum vs. f / f_d','Fontweight','bold')
xlabel('f (Hz)')
ylabel('S_d(f)')

axis([-1.2 1.2 0 4])

patch([-1 -1],[0 4],'k')
patch([1 1],[0 4],'k')
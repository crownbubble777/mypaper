%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 2: Fig 2.4                                      %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/05/2005                                        %%
%%                                                         %%
%% This code produces Figure 2.4, a plot of molecular      %% 
%%     resonance of H20 for frequencies above 10GHz.       %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------ Given Values -----%%

f = 10:.25:100; P = 1013; T = 300; pv = 7.5;

%%---- Determine Resonance -----%%

gam1 = (P/1013)*((300/T)^.626)*(1+.018*pv*T/P);
G = 1./((494.4-f.^2).^2+4*f.^2*gam1^2);
k = 2*pv*(300/T)^1.5*gam1*f.^2.*((300/T).*exp(-644/T).*G+1.2E-6);

%----- Plot Results -----%%

figure(1), semilogy(f,k/2,'k')
xlabel('Frequency (GHz)'), ylabel('Specific Attenuation (dB/km)')
title('\bfFigure 2.4 - Attenuation by Water at Sea Level')
axis([10 100 .0001 10])
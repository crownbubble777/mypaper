%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 6: Fig 6.29                                     %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/30/2004                                        %%
%%                                                         %%
%% This code creates Fig 6.29, a plot a direct path        %%
%%     Gaussian pulse and the received signal for three    %%
%%     different delay spreads.                            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% Ts - sampling rate                                        %
% numpulse - Order of Gaussian pulse                        %
% Tmax - maximum time of pulse duration                     %
% pulse - Gaussian pulse                                    %
% time - time axes                                          %
% pulsecompare - vector containing pulse and zero padding   %
% ptot - Total Power delay profile                          %
%%---------------------------------------------------------%%

%%------------------ Given Values ------------------%%

Ts = 2;   numpulse = 5;   Tmax = 15;

time = [0:999]*Tmax/999;

pulse = gausswin(100,5);

pulsecompare = [pulse' zeros(1,length(time) - length(pulse))];

test = [0:4]*Ts/20;

%%----- Determine Power Delay Profile -----%%

for k = 1:3
    
    t = test*k;   ptot = zeros(1,length(time));
    
    for j = 1:numpulse
        index = min(find(time > t(j))) - 1;
        p(j,:) = [zeros(1,index) pulse' zeros(1,length(time) - index - length(pulse))];
        ptot = ptot + p(j,:);
    end
    
    spread = sqrt(sum(t.^2)/numpulse)/Ts;
    
%%----- Plot Results -----%%
    
    subplot(3,1,k)
    plot(time,ptot/max(ptot),'k',time,pulsecompare,'k:')
    legend(['\sigma_',num2str(k)])
    axis([0 Tmax/5 0 1.2])
    xlabel('Excess Delay (nSec)')
    ylabel('Power Delay Profile')
end
subplot(311), title('\bfFigure 6.29 - Direct path Gaussian pulse and Received Signal for 3 Delay Spreads Causing Dispersion')
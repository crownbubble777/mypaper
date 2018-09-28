%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 6: Ex 6.2                                       %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/19/2004                                        %%
%%                                                         %%
%% This code creates Fig 6.7 of Ex 6.2, a plot of Rayleigh %%
%%     PDF vs envelope with threshold of 5 mV providing    %%
%%     probability of envelope exceeding the given         %%
%%     threshold.                                          %% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% sig - variance of Rayleigh pdf                            %
% r - envelope distribution (mV)                            %
%%---------------------------------------------------------%%

%%------------------ Given Values ------------------%%

sig = 3;
r = [0:1500]/100;

%%-------------- Determine Rayleigh PDF ------------%%

p = r.*exp(-r.^2/(2*sig^2))/sig^2;

%%------------------ Plot Results ------------------%%

plot(r,p,'k')

title('\bfFig 6.7 - Rayleigh PDF vs. Envelope for V_T = 5 mV','Fontweight','bold')
xlabel('Envelope r (mV)')
ylabel('p(r)')

axis([0 15 0 .25])
legend('\sigma = 0.005')

hold on

%%-------- Solution is Area Under the Curve --------%%

rr = [r(500) r(501:1501)];
pp = [0 p(501:1500) 0];
fill(rr,pp,[.9 .9 .9])

text(7.5,0.14,' \downarrow','FontSize',14)
text(5,0.16,'Solution is Shaded Area Under Curve','FontSize',11)
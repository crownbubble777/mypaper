%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                          %%
%% ******************************************************   %%
%% * Smart Antennas for Wireless Applications w/ Matlab *   %%
%% ******************************************************   %%
%%                                                          %%
%% Chapter 6: Ex 6.4                                        %%
%%                                                          %%
%% Author: Frank Gross                                      %%
%% McGraw-Hill, 2005                                        %%
%% Date:  9/29/2004                                         %%
%%                                                          %%
%% This code creates Fig 6.12 of Ex 6.4, a plot of a Rician %%
%%     distribution to determine probability of envelope    %%
%%     exceeding a threshold of 5 mV.                       %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%%------------------- Define Variables:---------------------%%
% sig - standard deviation                                   %
% var - variance of Rician PDF                               %
% A - Mean of Rician PDF                                     %
% r - Envelope of Rician PDF                                 %
% p - Rician PDF                                             %
%%----------------------------------------------------------%%

%%------------------ Given Values ------------------%%

sig = 3;   var = sig^2;   A = 5;   r = [0:1500]/100;

%%-------------- Determine Rician PDF --------------%%

p = r.*exp(-(r.^2 + A^2)/(2*var)).*besseli(0,A*r/var)/var;

%%------------------ Plot Results ------------------%%

plot(r,p,'k')
hold on

title('\bfFig 6.12 - Probability of Envelope Exceeding Threshold for Rician PDF','Fontweight','bold')
xlabel('r (mV)')
ylabel('p(r)')

axis([0 15 0 .2])

%%-------- Solution is Area Under the Curve --------%%

x = [r(500) r(500:1500) r(1500) r(500)];
y = [0 p(500:1500) 0 0];
fill(x,y,[.9 .9 .9])

text(7.5,0.14,' \downarrow','FontSize',18)
text(5,0.16,'Solution is Shaded Area Under Curve','FontSize',11)
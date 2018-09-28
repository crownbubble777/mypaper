%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 6: Ex 6.3                                       %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/19/2004                                        %%
%%                                                         %%
%% This code creates Fig 6.9 of Ex 6.3, a plot of Rayleigh %%
%%     PDF vs Power to determine outage probability,       %%
%%     defined by the shaded area under the curve.         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% po - Average Power (uW)                                   %
% p - Power (uW)                                            %
%%---------------------------------------------------------%%

%%------------------ Given Values ------------------%%

po = 2;
p = [0:800]/100;

%%-------------- Determine Rayleigh PDF ------------%%

p_p = exp(-p/po)/po;

%%------------------ Plot Results ------------------%%

plot(p,p_p,'k')

title('\bfFig 6.9 - Outage Probability of Rayleigh Channel Determined By Area Under Curve','Fontweight','bold')
xlabel('Power (\muV)')
ylabel('p(p)')

axis([0 8 0 .5])
legend('p_o = 2\muW')

hold on

%%-------- Solution is Area Under the Curve --------%%

rr = [0 p(1:100) p(100)];
pp = [0 p_p(1:100) 0];
fill(rr,pp,[.9 .9 .9])

text(2,0.35,'\leftarrow Solution is Shaded Area Under Curve','FontSize',11)
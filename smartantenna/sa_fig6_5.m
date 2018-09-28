%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                        %%
%% ****************************************************** %%
%% * Smart Antennas for Wireless Applications w/ Matlab * %%
%% ****************************************************** %%
%%                                                        %%
%% Chapter 6: Fig 6.5                                     %%
%%                                                        %%
%% Author: Frank Gross                                    %%
%% McGraw-Hill, 2005                                      %%
%% Date:  9/19/2004                                       %%
%%                                                        %%
%% This code creates Fig 6.5, examples of slow and fast   %%
%%     fading channels.                                   %%      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------ Given Values ------------------%%

x = (1:200)/100;  x1 = (1:200)/1600;  x2 = (1:200)/200;

y = randn(1,200); y = 1E-5*y/max(y);  % no coefficent can be larger than 1

y1 = cos(2*pi*x1);  y2 = .1*cos(2*pi*x2);  ytot = 1E-4*(y1 + y2);

%%------------------ Plot Results ------------------%%

plot(x,80*log10(ytot) + 304,'k', x,80*log10(ytot + y) + 304,'k:')

title('\bfFigure 6.5 - Slow Fading and Fast Fading Examples')
xlabel('Distance (km)')
ylabel('Received Power')

axis([0 2 -30 -10])
legend('Slow Fading','Fast Fading')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 6: Fig 6.11                                     %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/29/2004                                        %%
%%                                                         %%
%% This code creates Fig 6.11, a plot of a Rician          %%
%%     distribution for three different K values,-10,10,15 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%%------------------- Define Variables:--------------------%%
% var - variance of Rician PDF                              %
% r - Envelope of Rician PDF                                %
% K - Rician factor                                         %
% A - Mean of Rician PDF                                    %
% p - Rician PDF                                            %
%%---------------------------------------------------------%%

%%------------------ Given Values ------------------%%

var = 1;   r = 0:.005:12;   K = [-10 10 15];

%%------- Determine Rician PDF for 3 different K values ------%%

A1 = sqrt(2*var*10^(K(1)/10));
p1 = r.*exp(-(r.^2 + A1^2)/(2*var)).*besseli(0,A1*r/var);

A2 = sqrt(2*var*10^(K(2)/10));
p2 = r.*exp(-(r.^2 + A2^2)/(2*var)).*besseli(0,A2*r/var);

A3 = sqrt(2*var*10^(K(3)/10));
p3 = r.*exp(-(r.^2 + A3^2)/(2*var)).*besseli(0,A3*r/var);

%%------- For Iterative Solution use following code ------%%

% for j=1:3
%     A = sqrt(2*var*10^(K(j)/10));
%     p = r.*exp(-(r.^2+A^2)/(2*var)).*besseli(0,A*r/var);
%     plot(r,p)
%     hold on
% end

%%------------------ Plot Results ------------------%%

plot(r,p1,'k',r,p2,'k--',r,p3,'k:')

title('\bfFig 6.11 - Rician Distribution for 3 Different Rician Factors','Fontweight','bold')
xlabel('r')
ylabel('p(r)')

legend('K = -10 dB','K = 10 dB','K = 15 dB')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                          %%
%%  ******************************************************  %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *  %%
%%  ******************************************************  %%
%%                                                          %%
%% Chapter 4: Fig 4.22                                      %%
%%                                                          %%
%% Author: Frank Gross                                      %%
%% McGraw-Hill, 2005                                        %%
%% Date:  4/24/2005                                         %%
%%                                                          %%
%% This code creates Figure 4.22, a plot of a Kaiser-bessel %%
%%     weighted ULA beamsteered to thetao = 0, 30 & 60 degs. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:---------------------%%
% N - number of array elements                               %
% d - array element spacing (wavelengths)                    %
% M - 2N total number of array elements                      %
% theta - angle (deg)                                        %
% thetao - beamsteering angle (deg)                          %
% w - kaiser-bessel array weights of length N, alpha = 3     %
% AF - array factor of N element array                       %
%%----------------------------------------------------------%%

%%----- Given Values -----%%

N = 8; d = 0.5;  M = N/2;

theta = -pi/2:.001:pi/2; thetao = [0 30 60]*pi/180;

w = kaiser(N,3);

%%----- Determine Array Factor for Even Array -----%%

for k = 1:length(thetao)
    AF = 0;
    for n = 1:M
        AF = AF + w(n+M)*cos((2*n-1)*pi*d*(sin(theta)-sin(thetao(k))));
    end
    AF = 2*(AF); AF = AF/sum(w);

%%----- Plot Results -----%%

    plot(theta*180/pi,abs(AF)/max(abs(AF)),'k')
    axis([-90 90 0 1]), grid on
    xlabel('\theta (deg)'), ylabel('|AF_n|')
    title('\bfFigure 4.22 - Beamsteered Kaiser-Bessel Weighted Array w/ \theta_o = 0,30,60')
    hold on
end
legend('0^o','30^o','60^o',2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                          %%
%%  ******************************************************  %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *  %%
%%  ******************************************************  %%
%%                                                          %%
%% Chapter 4: Fig 4.20 & 4.21                               %%
%%                                                          %%
%% Author: Frank Gross                                      %%
%% McGraw-Hill, 2005                                        %%
%% Date:  4/24/2005                                         %%
%%                                                          %%
%% This code creates Figures 4.20 & 4.21, plots of Kaiser-  %%
%%     Bessel array weights for N = 8 ULA & the             %%
%%     corresponding weighted array factor vs. unweighted   %%
%%     array factor.                                        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:---------------------%%
% N - number of array elements                               %
% d - array element spacing (wavelengths)                    %
% theta - angle (deg)                                        %
% check - check to see if even or odd array                  %
% wb - binomial array weights of length N                    %
% AF - array factor of N element array                       %
% AFn - normalized array factor of N element array           %
%%----------------------------------------------------------%%

%%----- Given Values -----%%

N = 8; d = 0.5; theta = -pi/2:.01:pi/2; ang = theta*180/pi;

test=kaiser(N,3);
check=mod(N,2);

%%----- Produce Weighted Array Factor For Even or Odd Array -----%%

if check == 0
    wB = flipud(test(1:N/2)); wB = wB/max(wB);
    figure(1)
    stem(test/max(test),'k')
    xlabel('Element Number'), ylabel('Array Weights')
    title('\bfFigure 4.20 - Kaiser-Bessel Array Weights vs. Element Number')
    axis([1 N 0 1.1])
    AF = 0;
    tot = sum(wB);
    for i = 1:N/2
        AF = AF + wB(i)*cos((2*i-1)*pi*d*(sin(theta)));
    end
else
    wB = flipud(test(1:(N-1)/2+1)); wB = wB/max(wB);
    figure(1)
    stem(test/max(test),'k')    
    xlabel('Element Number'), ylabel('Array Weights')
    axis([1 N 0 1.1])
    AF = 0;
    tot = sum(wB);
    for i = 1:(N-1)/2+1
        AF = AF + wB(i)*cos(2*(i-1)*pi*d*sin(theta));
    end
end

AFn = sin(N*pi*d*sin(theta))./(N*pi*d*sin(theta));

%%----- Plot Results -----%%

figure(2), plot(ang,abs(AF)/tot,'k', ang,abs(AFn),'k:')
xlabel('\theta'), ylabel('|AF|')
title('\bfFigure 4.21 -  Kaiser-Bessel Weighted Array Factor vs. Angle')
axis([-90 90 0 1.1]), grid on
set(gca,'xTick',[-90:30:90])
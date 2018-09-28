%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                            %%
%%   ******************************************************   %%
%%   * Smart Antennas for Wireless Applications w/ Matlab *   %%
%%   ******************************************************   %%
%%                                                            %%
%% Chapter 4: Fig 4.8                                         %%
%%                                                            %%
%% Author: Frank Gross                                        %%
%% McGraw-Hill, 2005                                          %%
%% Date:  9/6/2004                                            %%
%%                                                            %%
%% This code creates Fig 4.8, a Family of Steered Directivity %%
%%     curves for a 4 element linear array with four steering %%
%%     angles:                                                %%
%%                                                            %%
%%     1. Endfire    2. 30 deg    3. 60 deg    4. broadside   %%
%%                                                            %%
%%     Where d = 0.5lambda.                                   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:-----------------------%%
% N - number of array elements                                 %
% F - inline function for numerator of Directivity equation    %
% theta0 - steering angle (deg)                                %
% den - denominator of Directivity equation                    %
% D - Directivity                                              %
%%------------------------------------------------------------%%

%%-------------------- Given Values ------------------------%%

N = 4;

%%---- Create inline object for numerator of Directivity equation (4.30) ----%%

F = inline('(sin(.5*N*pi*(cos(x)-cos(theta0)))./(.5*N*pi*(cos(x)-cos(theta0)))).^2');


%%---- for loop to perform integration in denominator of Directivity equation ----%%

n = 0;              % intital conditions for theta

delta = 0.0013;      
x = delta:delta:pi;

for i = 0:30:90     % steering angles: Endfire, 30, 60, Broadside
    n = n + 1;   
    theta0 = i*pi/180 + 0.01;
    den = trapz(x,F(N,theta0,x).*sin(x));
    D(n,:) = 2.*F(N,theta0,x)./den;
end

%%--------------------------- Plot Results ------------------------------%%

theta = x*180/pi;    % convert to degrees

plot(theta,D(1,:),theta,D(2,:),theta,D(3,:),theta,D(4,:))
axis([0 180 0 2*N+1]), grid on

title('\bf\itFig 4.8 - Family of Steered Directivity Curves')
xlabel('\theta (deg)')
ylabel('D(\theta,\theta_o)')

legend('End-Fire','30^0','60^0','Broadside')
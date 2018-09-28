%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                          %%
%%  ******************************************************  %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *  %%
%%  ******************************************************  %%
%%                                                          %%
%% Chapter 4: Fig 4.9                                       %%
%%                                                          %%
%% Author: Frank Gross                                      %%
%% McGraw-Hill, 2005                                        %%
%% Date:  4/24/2004                                         %%
%%                                                          %%
%% This code creates Fig 4.9, a family of steered array     %%
%%      maximum directivity curves for different            %%
%%      beamsteering angles.                                %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:---------------------%%
% N - number of array elements                               %
% theta - angle (deg)                                        %
% AF - array factor of N element array (inline)              %
% thetao - beamsteering angle (deg)                          %
% den - denominator of maximum directivity for ULA           %
% D - maximum directivity for ULA                            %
%%----------------------------------------------------------%%

%%----- Given Values -----%%

N = 4; delta = .0013; theta = delta:delta:pi;

%%----- Create Inline Function for Beamsteered Array Factor -----%%

AF=inline('(sin(.5*N*pi*(cos(x)-cos(theta0)))./(.5*N*pi*(cos(x)-cos(theta0)))).^2');

% Note: The argument of AF above could contain sin instead of cos. This just
% shifts the broadside of the array from 0 deg to 90 deg.

%%----- Determine Maximum Directivity for Beamsteered Array Factor -----%%

n = 0;
for i = 0:30:90
    n = n + 1;   
    theta0 = i*pi/180 + .01;
    den = trapz(theta,AF(N,theta0,theta).*sin(theta));
    D(n,:) = 2.*AF(N,theta0,theta)./den;
end

%%----- Plot Results -----%%

ang = theta*180/pi;
plot(ang,D(1,:),'k',ang,D(2,:),'k',ang,D(3,:),'k',ang,D(4,:),'k')
axis([0 180 0 2*N+1]), grid on
xlabel('\theta'), ylabel('D_o')
legend('End-Fire','30^0','60^0','Broadside')
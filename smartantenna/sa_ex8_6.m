%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                           %%
%%  ******************************************************   %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *   %%
%%  ******************************************************   %%
%%                                                           %%
%% Chapter 8: Ex 8.6                                         %%
%%                                                           %%
%% Author: Frank Gross                                       %%
%% McGraw-Hill, 2005                                         %%
%% Date:  3/05/2005                                          %%
%%                                                           %%
%% This code produces Figures 8.12-8.15, determines the      %%
%%     weights for directing the main beam of an N = 8,      %%
%%     d = 0.5 ULA towards a desired user at tho = 30 deg    %%
%%     and nulling an interferer at -60 deg using the LMS    %%
%%     algorithm.  The resulting weights are displayed, the  %%
%%     magnitude of the first 5 weights is plotted,          %%
%%     acquisition and tracking of desired user's signal is  %%
%%     displayed. Also, MSE is plotted and the resulting     %%
%%     weighted array factor pattern is plotted vs. AOA.     %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:----------------------%%
% N - # of elements in array                                  %
% d - element spacing in wavelengths                          %
% ang - theta in deg                                          %
% thetaS - desired user AOA (deg)                             %
% thetaI - interferer AOA (deg)                               %
% T - period of desired signal                                %
% t - time axis for desired signal                            %
% S - desired signal                                          %
% I - interfering signal                                      %
% vS,vI - steering vectors of desired user and interferers    %
% X - total array factor                                      %
% Rxx - total received signal correlation matrix              %
% mu - convergence parameter                                  %
% w - weights of ULA determined using LMS algorithm           %
% x - total received signal                                   %
% y - array output                                            %
% e - error between array output and desired signal           %
% theta - range of AOA's (rad)                                %
% AF - weighted array output                                  %
%%-----------------------------------------------------------%%

%%----- Givens -----%%

N = 8; d = .5; 

thetaS = 30*pi/180; thetaI = -60*pi/180;

%%----- Desired Signal & Interferer -----%%

T = 1E-3; t = (1:100)*T/100; it = 1:100;

S = cos(2*pi*t/T);

I = randn(1,100);
  
%%----- Create Array Factors for each user's signal for linear array -----%%

vS = []; vI = [];
i = 1:N;
vS = exp(1j*(i-1)*2*pi*d*sin(thetaS)).';
vI = exp(1j*(i-1)*2*pi*d*sin(thetaI)).';

%%----- Solve for Weights using LMS -----%%

w = zeros(N,1);
X = vS + vI;
Rxx = X*X';
mu = 1/(4*abs(trace(Rxx)));

wi = zeros(N,max(it));
for n = 1:length(S)
    x = S(n)*vS + I(n)*vI;
    y(n) = w'*x;
    e = conj(S(n)) - y(n);     esave(n) = abs(e)^2;
    w = w + mu*conj(e)*x;
    wi(:,n) = w;
end
w = w/w(1);    % normalize results to first weight

%%----- Display Weights -----%%

disp(' ')
disp('%------------------------------------------------------------------------%')
disp(' ')
disp(['   The weights for the N = ',num2str(N),' ULA are:'])
disp(' ')
for m = 1:length(w)
    disp(['   w',num2str(m),' = ',num2str(w(m),3)])
end
disp(' ')

%%----- Plot Results -----%%

% 1.) Plot Weights vs. Iteration No.

wi = wi.';
figure(1), plot(it,abs(wi(:,1)),'kx',it,abs(wi(:,2))...
    ,'ko',it,abs(wi(:,3)),'ks',it,abs(wi(:,4)),'k+',...
    it,abs(wi(:,5)),'kd','markersize',2)
xlabel('Iteration no.'), ylabel('|weights|')
title('\bfFigure 8.12 - Magnitude of Array Weights')

% 2.) Plot Signal acquisition and tracking

figure(2)
plot(it,S,'k',it,real(y),'k--')
xlabel('No. of Iterations'), ylabel('Signals')
title('\bfFigure 8.13 - Acquisition and Tracking of Desired Signal')
legend('Desired signal','Array output')

% 3.) Plot MSE

figure(3), plot(it,esave,'k')
xlabel('Iteration no.'), ylabel('|e|^2')
title('\bfFigure 8.14 - Mean Square Error vs. Iteration No.')

% 4.) Plot Array Factor

theta = -pi/2:.01:pi/2;
AF = 0;
for i = 1:N
    AF = AF + w(i)'.*exp(j*(i-1)*2*pi*d*sin(theta));
end

figure(4), plot(theta*180/pi,abs(AF)/max(abs(AF)),'k')
title(['\bfNormalized Array Factor for ULA of ',num2str(N),' Elements with Desired User @ ',...
       num2str(thetaS*180/pi),'^o & 1 Interferer @ ',num2str(thetaI*180/pi),'^o'])
xlabel('AOA (deg)'), ylabel('|AF_n|')
axis([-90 90 0 1]), grid on
set(gca,'xtick',[-90 -60 -30 0 30 60 90])
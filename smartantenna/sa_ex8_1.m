%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                           %%
%%  ******************************************************   %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *   %%
%%  ******************************************************   %%
%%                                                           %%
%% Chapter 8: Ex 8.1                                         %%
%%                                                           %%
%% Author: Frank Gross                                       %%
%% McGraw-Hill, 2005                                         %%
%% Date:  3/05/2005                                          %%
%%                                                           %%
%% This code produces Figure 8.4, determines the weights for %%
%%     directing the main beam of an N = 5, d = 0.5 ULA      %%
%%     towards a desired user at tho = 0 deg and nulling     %%
%%     interferers at 25, -15 deg using the Max SINR method. %%
%%     The resulting weighted array factor pattern is plotted%%
%%     vs. arrival angle.                                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:----------------------%%
% M - # of elements in array                                  %
% d- element spacing in wavelengths                           %
% theta - arrival angle of desired users and interferers (rad)%
% a0,a1,a2 - steering vectors of desired user and interferer  %
% A - matrix of steering vectors                              %
% w - weights of ULA determined using Max SINR method         %
% th - range of AOA's (rad)                                   %
% y - weighted array output                                   %
%%-----------------------------------------------------------%%

%----- Enter given values -----%

M = 5; d = 0.5; theta = [0 25 -15]*pi/180; 

u = [1;zeros(length(theta)-1,1)];

%----- Determine steering vectors and matrix of steering vectors -----%

a0 = []; a1 = []; a2 = [];
i = -(M/2-.5):(M/2-.5)
a0 = exp(1j*i*2*pi*d*sin(theta(1))).'; 
a1 = exp(1j*i*2*pi*d*sin(theta(2))).'; 
a2 = exp(1j*i*2*pi*d*sin(theta(3))).'; 

A = [a0,a1,a2];

%----- Determine Array Weights -----%

w = u.'*A'*inv(A*A'+1e-9*eye(M));  % add small value to diagonal
                                   % of A*A' so inverse is non-singular                                 
                                   
%----- Display normalized weights -----%

disp(' ')
disp('  The array weights for the Maximum SIR beamformer are:')
disp(' ')
for m = 1:length(w)
    disp(['   w',num2str(m),' = ',num2str(conj(w(m)),3)])
end

% We display conj(w) because the weights solved for above are actually
%    equal to w' where (') is the Hermitian transpose operator  

%----- Determine Array Factor -----%

th = -pi/2:.001:pi/2;

y = 0;
for l = -(M/2-.5):M/2-.5
    y = y + w(l+(M/2+.5)).*exp(1j*l*2*pi*d*sin(th));
end

%----- Plot Results -----%

plot(th*180/pi,abs(y)/max(abs(y)),'k')
axis([-90 90 0 1])
title('\bfFigure 8.4 - Array Factor Pattern for Fixed Weight Beamformer')
xlabel('DOA (deg)'), ylabel('|AF(\theta)|')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 6: Fig 6.3                                      %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/19/2004                                        %%
%%                                                         %%
%% This code creates Fig 6.3, a plot of phase for directed %%
%%    and reflected signals over flat earth.               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% x - 2*k*h1*h2/d                                           %
% R - Reflection Coefficient                                %
% X, Y - envelope rectangular components                    %
% phase - phase                                             %
%%---------------------------------------------------------%%

%%------------------ Given Values ------------------%%

x = 0:.01:4*pi;

R1 = 0.3;  R2 = 0.6;  R3 = 0.9;

%%-------- Determine Envelope Components & Phase -------%

X1 = 1 + R1*cos(x);
Y1 = R1*sin(x);
phase1 = atan2(Y1,X1);


X2 = 1 + R2*cos(x);
Y2 = R2*sin(x);
phase2 = atan2(Y2,X2);


X3 = 1 + R3*cos(x);
Y3 = R3*sin(x);
phase3 = atan2(Y3,X3);

%%------- For Iterative Solution use following code ------%%

% for j = 1:3
%     R = 0.3 + (j - 1)*0.3
%     X = 1 + R*cos(x);
%     Y = R*sin(x);
%     phase = atan2(Y,X);
%     plot(x,phase*180/pi,'k')
%     hold on
% end

%%------------------ Plot Results ------------------%%

plot(x,phase1*180/pi,'--k',x,phase2*180/pi,':k',x,phase3*180/pi,'-.k',x,0,'k')

title('\bfFigure 6.3 - Phase of Directed & Reflected Signals Over Flat Earth')
xlabel('(2kh_1h_2)/d')
ylabel('Phase (deg)')

legend('|R| = 0.3','|R| = 0.6','|R| = 0.9','Direct Path')
axis([0 12 -90 90])
grid on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 6: Fig 6.2                                      %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/19/2004                                        %%
%%                                                         %%
%% This code creates Fig 6.2, a plot of envelope for       %%
%%     directed and reflected signals over flat earth.     %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% x - 2*k*h1*h2/d                                           %
% R - Reflection Coefficient                                %
% X, Y - envelope rectangular components                    %
% env - envelope                                            %
%%---------------------------------------------------------%%

%%------------------ Given Values ------------------%%

x = 0:.01:4*pi;

R1 = 0.3;  R2 = 0.6;  R3 = 0.9;

%%-------- Determine Envelope Components & Envelope -------%

X1 = 1 + R1*cos(x);
Y1 = R1*sin(x);
env1 = sqrt(X1.^2 + Y1.^2);


X2 = 1 + R2*cos(x);
Y2 = R2*sin(x);
env2 = sqrt(X2.^2 + Y2.^2);


X3 = 1 + R3*cos(x);
Y3 = R3*sin(x);
env3 = sqrt(X3.^2 + Y3.^2);

%%------- For Iterative Solution use following code ------%%

% for j = 1:3
%    R = 0.3 + (j - 1)*0.3
%    X = 1 + R*cos(x);
%    Y = R*sin(x);
%    env = sqrt(X.^2 + Y.^2);
%    plot(x,env)
%    hold on
% end

%%------------------ Plot Results ------------------%%

plot(x,env1,'--k',x,env2,':k',x,env3,'-.k',x,1,'k')

title('\bfFigure 6.2 - Envelope of Directed & Reflected Signals Over Flat Earth')
xlabel('(2kh_1h_2)/d')
ylabel('Envelope')

legend('|R| = 0.3','|R| = 0.6','|R| = 0.9','Direct Path')
axis([0 12 0 2])
grid on
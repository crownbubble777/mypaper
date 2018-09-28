%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 6: Fig 6.17                                     %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/30/2004                                        %%
%%                                                         %%
%% This code creates Fig 6.17, a demonstration of time     %%
%%     varying channel impulse response given in equation  %%
%%     6.29.                                               %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% N - total number of paths in channel                      %
% a - time varying amplitude of path n                      %
% h - channel impulse response                              %
%%---------------------------------------------------------%%

%%------------------ Given Values ------------------%%

N=20;

%%----- Determine Amplitudes and Impulse Response -----%%

for j = 1:4
    a = randn(N,1);
    a = abs(a)/max(abs(a));
    a = fliplr(sort(a'));
    a = a';
    test = ceil(rand(6,1)*N);
    test = sort(test);
    h(test,j)=a(test);
end

%%------------------ Plot Results ------------------%%

[M,N] = size(h);

x = [1:N];     y = [1:M];

[X,Y]=meshgrid(x,y);

stem3(X,Y,h,'k')

title('\bfFig 6.17 - Demonstration of Time-Varying Channel Impulse Response')
xlabel('t')
ylabel('\tau')
zlabel('h_c(t,\tau)')

set(gca,'ydir','reverse')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                         %%
%% ******************************************************  %%
%% * Smart Antennas for Wireless Applications w/ Matlab *  %%
%% ******************************************************  %%
%%                                                         %%
%% Chapter 4: Fig 4.29                                     %%
%%                                                         %%
%% Author: Frank Gross                                     %%
%% McGraw-Hill, 2005                                       %%
%% Date:  9/12/2004                                        %%
%%                                                         %%
%% This code creates Fig 4.29, an Array Factor pattern for %%
%%     a N = 4 Butler Matrix, with d = lambda/2.           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------%%
% d - Element spacing                                       %
% N - Number of stages in Butler Matrix                     %
% theta - angle (deg)                                       %
% AF - Array Factor for Butler Matrix                       %
%%---------------------------------------------------------%%

%%---------------------- Given Values ----------------------%%

d = .5;  N = 4;
theta = -pi/2:.01:pi/2;

%%------------ Create Array Factor for Butler Matrix ------------- %%

for j = -(N - 1):2:N - 1
  AF = sin(N*pi*d*sin(theta) - j*pi/2)./(N*pi*d*sin(theta) - j*pi/2);
  AF = abs(AF);
  polar(theta,abs(AF),'k')
  hold on
  view(-90,90)
end

title('\bfFig 4.29 - N = 4 Butler Matrix Array Factor, d = \lambda/2')
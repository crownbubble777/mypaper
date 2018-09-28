%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                          %%
%%  ******************************************************  %%
%%  * Smart Antennas for Wireless Applications w/ Matlab *  %%
%%  ******************************************************  %%
%%                                                          %%
%% Chapter 4: Fig 4.2                                       %%
%%                                                          %%
%% Author: Frank Gross                                      %%
%% McGraw-Hill, 2005                                        %%
%% Date:  9/6/2004                                          %%
%%                                                          %%
%% This code creates three distinct 2-D polar plots         %%
%%     concerning equation (4.5) in the text.  The three    %%
%%     plots created are:                                   %%
%%                                                          %%
%%     4.2a - Element Factor Pattern (EF) of Single Dipole  %%
%%                Element.                                  %%
%%     4.2b - Array Factor (AF) for 2 Element Array.        %%
%%     4.2c - EF x AF = Far Field Pattern of Array.         %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:---------------------%%
% theta - angle (deg)                                        %                                      
% delta - phase difference between 2 adjacent elements       %
% EF - Element Factor                                        %
% AF - Array Factor                                          %
%%----------------------------------------------------------%%

%%--------------------- Given Values -----------------------%%

theta = 0:.001:2*pi;
delta = 0;

%%---------- Determine Element Factor and Array Factor ------%%

EF = sin(theta).^2;
AF = cos(pi*sin(theta)/2 + delta/2).^2;

%%--------------------- Plot Results ------------------------%%

figure

% Figure 4.2a - Element Factor Pattern

subplot(311)
polar(theta,EF,'k')
view(90,-90)
title('\bf\itFigure 4.2a - Element Factor Pattern (EF) Dipole Element')

% Figure 4.2b - Array Factor Pattern

subplot(312)
polar(theta,AF,'k')
view(90,-90)
title('\bf\itFigure 4.2b - Array Factor Pattern (AF) 2 Element Array')

% Figure 4.2c - Total Far Field Pattern

subplot(313)
polar(theta,EF.*AF,'k')
view(90,-90)
title('\bf\itFigure 4.2c - EF x AF = Far Field Pattern of 2 Element Array')
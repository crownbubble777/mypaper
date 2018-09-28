%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                        %%
%% ****************************************************** %%
%% * Smart Antennas for Wireless Applications w/ Matlab * %%
%% ****************************************************** %%
%%                                                        %%
%% Chapter 3: Fig 3.19                                    %%
%%                                                        %%
%% Author: Frank Gross                                    %%
%% McGraw-Hill, 2005                                      %%
%% Date:  9/3/2004                                        %%
%%                                                        %%
%% This code creates Figure 3.20, a plot of the maximum   %%
%%     Directivity (dB) for a circular loop antenna vs.   %%
%%     Circumference (C/lambda)                           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      

%%------------------- Define Variables:--------------------------%%
% U - inline fcn to create loop antenna radiation intensity       %
% delta - negative limit of integration and integration step size %
% x - limits of integration                                       %
% C - circumference of loop antenna in wavelengths                %
% den - denominator of maximum directivity equation               %
% num - numerator of maximum directivity equation                 %
% Do - maximum directivity of loop antenna                        %
%%---------------------------------------------------------------%%

%-------- Initialize Variables ----------%

U = inline('(besselj(1,c*sin(x))).^2.*sin(x)');  % inline object for den. function

delta = 0.1;   x = 0:delta:pi;

%----- Create for loop to compute Do -----%

for i = 1:100
    c = i/5;
    C(i) = c;
den = trapz(x,U(c,x));
num = 2*max(besselj(1,c*sin(x)).^2);
temp = num/den;
Do(i) = temp;
end

%----- Plot Results -----%

plot(C,10*log10(Do),'k')
axis([0 20 0 12])

title('\bfFig 3.20 - Maximum Directivity vs. Circumference for a Loop')
xlabel('C/\lambda')
ylabel('D_o (dB)')
grid on
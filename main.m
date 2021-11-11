%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title        : Assignment Numerical Computation Lecture 10
% Author       : Azka Hariz
% Date         : November 7, 2021
% Code version : 1.1
% Availability : https://github.com/azkahariz/integrationMethod
%
% Please add the following citations if you use this code:
% Hariz, A (2021)  Assignment Numerical Computation Lect 10 (Version 1.1)
% [Source code]. https://github.com/azkahariz/integrationMethod
% 
% In this source code, there are several integral programs:
% 1. Trapezoidal method 1 segment
% 2. Multi-segment trapezoidal method
% 3. The Simpsons 1/3 rule method
% 4. The Simpsons 3/8 rule method
% 5. Romberg's method
% 6. Gauss Quadrature Method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all; clc

% input function here
x = -3:0.01:3;
f = @fun;

% Bound
a = 0;      % lower bound
b = 2;
% b = 0.8;  % upper bound
I_true = -68/3; % Analytic

%% Trapezoidal method 1 segment
I_trap = trapezoidal(1,a,b,f);

%% Multi-segment trapezoidal method (n = 2 to 10)
n = 2:10;
I_trap = [I_trap; trapezoidal(n,a,b,f)];
clear n;

%% The Simpsons 1/3 rule method
n = 2:2:10;
I_sp13 = simpson13(n,a,b,f);
clear n;

%% The Simpsons 3/8 rule method
n = 3:3:9;
I_sp38 = simpson38(n,a,b,f);
clear n;

%% Romberg's method
n = 8;
[I_romb,v] = romberg(n,a,b,f);

%% Gauss Quadrature Method
for i=2:5 
    I_gsqd(i-1,1) = gaussQuad(i,a,b,f);
end

%% True Percent Relative Error 
% Error trapezoidal
e_trap = abs((I_true - I_trap)/I_true)*100;
% Error Simpson 1/3
e_sp13 = abs((I_true - I_sp13)/I_true)*100;
% Error Simpson 3/8
e_sp38 = abs((I_true - I_sp38)/I_true)*100;
% Error Romberg
e_romb = abs((I_true - v)/I_true)*100;
% Error Gauss-Quadratur
e_gsqd = abs((I_true - I_gsqd)/I_true)*100;
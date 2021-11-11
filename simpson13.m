%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title        : The Simpsons 1/3 rule method (Integration)
% Author       : Azka Hariz
% Date         : November 9, 2021
% Code version : 1.1
% Availability : https://github.com/azkahariz/integrationMethod
%
% Please add the following citations if you use this code:
% Hariz, A (2021)  The Simpsons 1/3 rule method (Integration) (Version 1.1) 
% [Source code]. https://github.com/azkahariz/integrationMethod
%  
% How to use:
% n is number of segment and must be even, a is lower bound of integral, b
% is upper bound of integral, and f is a function  of f(x). The output is 
% integration result I, and every segment width h.
% Example : f(x) = 0.2 + 25*x - 200*x^2 + 675*x^3 - 900*x^4 + 400*x^5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [I,h] = simpson13(n,a,b,f)
    sum_f = zeros(max(size(n)),1);
    h(1:max(size(n)),1) = (b - a)./n;
    for j = 1:max(size(n))
        for i = 0:2:(n(j)-2)
            sum_f(j) = sum_f(j) + f(a+i*h(j)) + 4*f(a+(i+1)*h(j)) + f(a+(i+2)*h(j));
        end
    end
    I = h/3.*sum_f;
end
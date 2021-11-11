%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title        : Romberg's method (Integration)
% Author       : Azka Hariz
% Date         : November 11, 2021
% Code version : 1.1
% Availability : https://github.com/azkahariz/integrationMethod
%
% Please add the following citations if you use this code:
% Hariz, A (2021)  Romberg's method (Integration) (Version 1.1)
% [Source code]. https://github.com/azkahariz/integrationMethod
%
% How to use:
% n is the number of segments and must be a n = 2^i.
% a is the lower bound of the integral, and b is the upper bound of the
% integral. f is a function of f(x) to be found integral. The output is the
% result of integration I.
% Example : f(x) = 0.2 + 25*x - 200*x^2 + 675*x^3 - 900*x^4 + 400*x^5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [I,v] = romberg(m,a,b,f)
for i = 0:log2(m)
    if i == 0
        n = 2^i;
    else
        n = [n; 2^i];
    end
end

I(1:log2(m)+1,1) = trapezoidal(n,a,b,f);
for k = 2:max(size(n))
    for j = 1:max(size(n)) - k + 1
        I(j,k) = (4^(k-1)*I(j+1,k-1) - I(j,k-1))/(4^(k-1)-1);
    end
end
for i=1:max(size(n))
    v(i,1) = I(max(size(n))+1-i,i);
end
end
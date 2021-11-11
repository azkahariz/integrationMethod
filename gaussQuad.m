%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title        : Gauss Quadrature Method (Integration)
% Author       : Azka Hariz
% Date         : November 11, 2021
% Code version : 1.1
% Availability : https://github.com/azkahariz/integrationMethod
%
% Please add the following citations if you use this code:
% Hariz, A (2021)  Gauss Quadrature Method (Integration) (Version 1.1) 
% [Source code]. https://github.com/azkahariz/integrationMethod
%  
% How to use:
% n is the desired number of points. The number of points available in the
% program n = 2, 3, 4, and 5. a is the lower bound, and b is the upper
% bound. f is a function of f(x) whose integral result is sought. I is the
% output of the result of the integration.
% Example : f(x) = 0.2 + 25*x - 200*x^2 + 675*x^3 - 900*x^4 + 400*x^5;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function I = gaussQuad(n,a,b,f)
if n == 2
    x = [-0.577350269; 0.577350269];
    w = [ 1.000000000; 1.000000000];
    x = (a+b)/2 + (b-a)*x/2;
    I = (b-a)*sum(w.*f(x))/2;
elseif n == 3
    x = [-0.861136312; -0.339981044; 
          0.339981044;  0.861136312];
    w = [ 0.347854845;  0.652145155;
          0.652145155;  0.347854845];
    x = (a+b)/2 + (b-a)*x/2;
    I = (b-a)*sum(w.*f(x))/2;
elseif n == 4
    x = [-0.774596669; 0.000000000; 0.774596669];
    w = [ 0.555555556; 0.888888889; 0.555555556];
    x = (a+b)/2 + (b-a)*x/2;
    I = (b-a)*sum(w.*f(x))/2;
    
elseif n == 5
    x = [-0.906179846; -0.538469310; 0.000000000;
        0.538469310;  0.906179846];
    w = [0.236926885;   0.478628670; 0.568888889;
        0.478628670;   0.236926885];
    x = (a+b)/2 + (b-a)*x/2;
    I = (b-a)*sum(w.*f(x))/2;
else
    error('Masukan n antara 2 sampai 5');
end
end


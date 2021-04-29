function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
% falsePosition finds the root of a function using the false position method
% 
% Inputs
%   func  - the function being evaluated
%   xl    - the lower guess/bracket
%   xu    - the upper guess/bracket
%   es    - stopping critera (default 0.0001%)
%   maxit - maximum number of iterations (default 200)
%   varargin - any additional paramaters to be used by the function
% 
% Outputs
%   root - the estimated location of the root
%   fx   - the function evaluated at the root
%   ea   - approxiamte relative error %
%   iter - number of interations completed
% 
% Created by Bryan Slaughter in March 2021 for MECH 105 Homework 11

% Check input arguments
if nargin < 3
    error('At least 3 input arguments required');
end
if nargin == 3
    es = 0.0001;
end
if nargin <= 4
    maxit = 200;
end

% check if sign change over interval
if func(xl)*func(xu) > 0
    error('No sign change over the interval')
end

% Time to iterate baby
iter = 0;
ea = 100;
while ea > es && iter < maxit
    if iter ~= 0
        xold = xr;
    end
    
    % find new root and iter + 1
    xr = xu - (func(xu)*(xl-xu))/(func(xl)-func(xu));
    iter = iter + 1;
    
    % calc aprox rel error
    if func(xr) == 0
        ea = 0;
    elseif iter ~= 1
        ea = abs((xr-xold)/xr) * 100;
    end
    
    % find new bounds
    if func(xu)*func(xr) < 0
        xl = xr;
    else
        xu = xr;
    end
end

root = xr;
fx = func(xr);
end
function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
%       Uses trapazoidal rule for last interval if number
%       of intervals is odd.
%
% Inputs
%   x - vector of equally spaced independent variable
%   y - vector of function values with respect to x
%
% Outputs:
%   I - the numerical integral calculated
%
% Created by Bryan Slaughter in April 2021 for MECH 105 Homework 22

% Check input arguments
if nargin ~= 2
    error('Must have 2 input arguments');
end

% Check for vectors
if ~isvector(x) || ~isvector(y)
    error('Input arguments must be vectors');
end

% Check x y same size
if length(x) ~= length(y)
    error('Input vectors must be the same size');
end

% Check equal spacing
if max(diff(diff(x))) > 1e-10   % if max spacing is greater than threshold, throw error
    error('Values in x must be equally spaced');
end

% Meat
len = length(x);
% Check for odd intervals and do trap rule if necissarry
if mod(len, 2) == 0             % odd intervals - trap
    warning('Odd number of intervals, using trapazoidal rule on last interval');
    I = (x(len)-x(len-1)) * (y(len)+y(len-1)) / 2;  % trap rule
    lim = 2;                                        % set iteration limit for simpsons rule
else                             % even intervals - no trap
    I = 0;                                          % preset I = 0 b/c no trap rule
    lim = 1;                                        % set iteration limit for simpsons rule
end

% Do compound simpson 1/3 for the rest
for k = 2:2:len-lim
    I = I + ((x(k+1) - x(k-1)) * (y(k-1) + 4*y(k) + y(k+1)) / 6);
end

end

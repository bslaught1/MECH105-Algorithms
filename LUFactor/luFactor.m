function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition of inputed matrix, with pivotiing
%
% Inputs:
%	A = coefficient matrix
%
% Outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix
%
% Created by Bryan Slaughter in March 2021 for MECH 105 Homework 17

% Check arguments
if nargin ~= 1
    error('Must have one input argument');
end

% Check if A is square
[n, m] = size(A);
if n ~= m
    error('Inputed matrix must be sqaure');
end

% Premake arrays U, L, and P
U = A;
L = zeros(n,m);
P = eye(n);                     % add diagonal ones to P to track pivots


% Meat and Potatoes
for s = 1:n-1                   % Loop thorugh working rows (s = current working row)
    
    % Partial pivot
    [big, idx] = max(abs(U(s:n,s)));    % find max value of values below working row
    idx = idx + (s-1);                  % Account for value loss from slice in previous line
    
    if big > U(s,s)                     % If largest value in the column is larger than first
        % Pivot U                       % value in working row
        temp = U(s,:);                      % Then pivot each matrix so that the biggest is
        U(s,:) = U(idx,:);                  % now the working row
        U(idx,:) = temp;
        % Pivot L
        temp = L(s,:);
        L(s,:) = L(idx,:);
        L(idx,:) = temp;
        % Pivot P
        temp = P(s,:); 
        P(s,:) = P(idx,:);
        P(idx,:) = temp;
    end
    
    % Factor
    for j = s+1:n                   % Loop through rows below working row and eliminate first value
        mult = U(j,s)/U(s,s);               % Calculate the elimination multiplier
        U(j,:) = -mult*U(s,:) + U(j,:);     % Eliminate first value in lower row
        L(j,s) = mult;                      % add mult to correct position in L
    end
end

L = L + eye(n);                 % Add diagonal ones to L to correctly format L matrix

end
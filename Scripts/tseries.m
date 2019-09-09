function [X] = tseries(N, alpha)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
M = [];
M(1) = normrnd(0,1/(1-alpha^2));
for i = 1:N-1
    zeta = randn;
    disp(zeta)
    M(i+1) = alpha*M(i) + zeta; 

end
X = M;

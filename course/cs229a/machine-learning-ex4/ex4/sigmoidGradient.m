function g = sigmoidGradient(z)
%SIGMOIDGRADIENT returns the gradient of the sigmoid function
%evaluated at z
%   g = SIGMOIDGRADIENT(z) computes the gradient of the sigmoid function
%   evaluated at z. This should work regardless if z is a matrix or a
%   vector. In particular, if z is a vector or matrix, you should return
%   the gradient for each element.

% note they do this assignment so that Octave runs faster
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the gradient of the sigmoid function evaluated at
%               each value of z (z can be a matrix, vector or scalar).

% if g(z) is the sigmoid then g'(z) is g(z)*(1-g(z))

% to make this work on matrices, you just compute the individual entriez
g = sigmoid(z) .* (1-sigmoid(z));


% =============================================================

end

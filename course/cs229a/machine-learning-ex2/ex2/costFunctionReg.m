function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

% the hypothesis because theta' * X is the same as inverting and taking the
% transpose
h = sigmoid(X*theta);

% regularization uses the trick to get sum of square theta since that
% just the dot product of itself
% since we don't want theta(1) regularized, we take the dot product of the rest
regularization = lambda/(2*m) * (theta(2:end)' * theta(2:end));
J = 1/m * ( -y'*log(h) - (1-y') * log(1 - h)) + regularization;

% calculating the gradient, use the trick to reverse the term
% so do all at once then fix the first term

grad_regularization = lambda/m .* theta';

grad = 1/m * (h-y)' * X + grad_regularization;

grad(1) -= grad_regularization(1);
% =============================================================

end

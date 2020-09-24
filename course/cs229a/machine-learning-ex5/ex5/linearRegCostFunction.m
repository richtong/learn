function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the
%   cost of using theta as the parameter for linear regression to fit the
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
% assume bias is already added
%X = [ ones(rows(X),1) X ];

% in the class h(X) = theta*X, but the way they are defined we need the revers
h = X*theta;
% note that the sum works because h and y are both column vectors
Junreg = 1/(2*m) * sum(( h - y ).^2);
regularization = lambda / (2*m) * sum((theta(2:end,:) .^ 2)(:));
J = Junreg + regularization;

% =========================================================================
% note we use the transpose and first sot he gradient is a column vecotr
gradUnreg = 1/m * X'*(h-y);
gradRegularization = lambda/m * [ zeros(1,columns(theta)) ; theta(2:end,:) ];
grad = gradUnreg + gradRegularization;

% roll up the gradients
grad = grad(:);

end

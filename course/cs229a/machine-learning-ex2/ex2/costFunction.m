function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
% J = 0;
% grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

% first get the predition theta' * X which is a m x 1 column vector
% that looks like a bunch of 1s and 0s as y can only be 1 or zero at start
thetaX = X * theta;
% note that is theta = zeros(n, 1_ then the sigmoid if 0.5
h=sigmoid(thetaX);

% y is a column vector that is m rows long so it is m x 1, h is the same, so to
% do the dot product you need to transpose one of them so either log(h') * y
% but you want the firt operand to have one row so it ends up as a scaler
% one way to figure this out is that if the overall
% formula looks like sum(-y(i) * h(x(i))) then this is a classic dot product
% so that you want the i'th elements to be multiplied, so you want the row
% vector y' * h(x) and this will give you exactly that
J = 1/m * (-y'*log(h) - (1-y)'*log(1-h));

% this one is a little tricker since each row of grad is not m rows, but n
% features, ni this csse yo want the same vecort which is m rows long but you
% want it multiplied by feature vector pont, note that in this csse you want
% theta to be a column vector, so you have to flip it.
grad = 1/m * (h - y)' * X;


% =============================================================

end

function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

% compute h for all theta, note the order is important here
% in the previous examples, it was h = theta' * X, but this means that
% octave is going to take a 2 x 1 and make it a matrix
%
% this calculation of h is comoletely different, you must have theta last
% as this you need a row matrix times a column vector.
% So that theta' * X doews not work.

% h is the predicted y based on the features X
h = X * theta;
squaredError = (h - y) .^ 2;
J = 1/(2*m) * sum(squaredError);

% =========================================================================

end

function p = predict(theta, X)
%PREDICT Predict whether the label is 0 or 1 using learned logistic
%regression parameters theta
%   p = PREDICT(theta, X) computes the predictions for X using a
%   threshold at 0.5 (i.e., if sigmoid(theta'*x) >= 0.5, predict 1)

m = size(X, 1); % Number of training examples

% You need to return the following variables correctly
% p = zeros(m, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters.
%               You should set p to a vector of 0's and 1's
%

% theta is a n x 1 column vector and X is m rows and n column of features
% so to get the prediction you need m x 1 column vector
% m x n * n x 1
% octave is pretty cool so equality will change all the rows
p = (sigmoid(X * theta)) >= 0.5;





% =========================================================================


end

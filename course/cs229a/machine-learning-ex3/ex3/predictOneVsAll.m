function p = predictOneVsAll(all_theta, X)
%PREDICT Predict the label for a trained one-vs-all classifier. The labels
%are in the range 1..K, where K = size(all_theta, 1).
%  p = PREDICTONEVSALL(all_theta, X) will return a vector of predictions
%  for each example in the matrix X. Note that X contains the examples in
%  rows. all_theta is a matrix where the i-th row is a trained logistic
%  regression theta vector for the i-th class. You should set p to a vector
%  of values from 1..K (e.g., p = [1; 3; 1; 2] predicts classes 1, 3, 1, 2
%  for 4 examples)

m = size(X, 1);
num_labels = size(all_theta, 1);

% You need to return the following variables correctly
p = zeros(size(X, 1), 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters (one-vs-all).
%               You should set p to a vector of predictions (from 1 to
%               num_labels).
%
% Hint: This code can be done all vectorized using the max function.
%       In particular, the max function can also return the index of the
%       max element, for more information see 'help max'. If your examples
%       are in rows, then, you can use max(A, [], 2) to obtain the max
%       for each row.
%

% First generate predictions, the normal formula is
% h(x) = sigmoid(X * theta')
% where X is m rows of predictions and n columns of features
% and Theta is a column vector of n features
% so we have mxn * nx1 in effect each row of X is multipied by theta which is
% the correct dot product leaves an m x 1 which are the probabilities

% Now for the general case where we have X which is mxn then
% if we have theta_all which are all predictions for c classes so we have c rows
% with n features in column so we have c x n
% so the multiplication of X * c is a (mxn) * (cxn)' or (mxn) * (nxc) will leave
% use with m rows and c rows where each is the guess.

pred = sigmoid(X * all_theta');

% now we want to figure out of all of these, so we want for each row,
% what is the maximum along the features
% max will figure this out columnwise, so need to use the transpose
% pred' is a c feature in each row x m columns of samples
% now the iguess array is nearly what we want except that the
% so we can just see which guess are correct with
% Now if we use the special max(X, [], DIM) then we can just do a row major
% search
% If not using the special max, do a transform first
%[maximum, maxcol] = max(pred');
% p = maxcol';

[maxvalues, p ] = max(pred, [], 2);

% Now the this is a row vector, but we want a column one

% =========================================================================


end

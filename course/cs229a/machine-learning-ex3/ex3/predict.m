function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% add the bias 1 to every row in X, so A1 is an m samples x n features
A1 = [ ones(m, 1) X ];
n = columns(A1);


% now generate the new hidden layer whch is going to be the n rows of m features
% times a theta which is 25 rows and m features
% this should results in n rows of 25 features in A1
% (nxm) * (25xm)' results in n rows x 25 features of the A2 level
% the other way to think about this is that non-vectorized, theta is a column
% vector so you need the transpose to get it back into that form
Z2 = A1*Theta1';
A2 = sigmoid(Z2);

% now we need to add the additional 1 bias so now A2 is n rows of samples x 26
% features where the first column is all ones
A2 = [ ones(rows(A2),1) A2 ];

% in the next output layer, we take the 26
% Now we need to again multiply by theta2
% so we have A2 is n rows x 26 features columns and Theta 2 is 10 rows and 26
% columns, so again take nx26 * (10x26)'

Z3 = A2*Theta2';
A3 = sigmoid(Z3);
h=A3;


% now convert the predictions into rows as we did before
% so the hypotheiss is n samples x rows(Theta2) features
% so take the max of the feature probabilities by havin
% max do a max in the row (eg row major) and then
% return the index of that element which is the same as the digit
% in p
[ maxprob, p ] = max(h, [], 2);

% =========================================================================


end

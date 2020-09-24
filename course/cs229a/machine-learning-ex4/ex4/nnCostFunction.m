function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices.
%
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);

% You need to return the following variables correctly
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

% Calculate the cost function J
% J(theta) = 1/m sum(all examples m), sum(all classifers) -y * log(h) - (1-y)
% log(1-h), in a three layer model, we first calculate a2 and then a3=h

% first get the initial inputs, adding the bias where the rows of X are equal
% to the m that is number of samples
A1 = [ ones(m,1) X ];
% Theta1 is 401x25 so it transforms 401 A1s into 25 A2s
% A1 is m rows 5000 x 401 features so mxn * n*25 which are the number of A1
% nodes
Z2 = A1 * Theta1';
% now add the bias so we will have m sample rows and 26 in the hidden layer
A2 = [ ones(m,1) sigmoid(Z2) ];

% Now finally calculate the hypothesis H
Z3 = A2 * Theta2';

% Note that we do not a bias for the final stage, this is not needed on output
H=A3=sigmoid(Z3);

% Now compute the function J is normally done this way for a single classifier
% J= 1/m * (-y * log(h) - (1-y)*log(1-h)
% But we have K classifiers, so the formula needs another sum

% the y we get isn't a vector, but a collection of indices
% So it is m columns wide and column has a 1 at the right place
Y=zeros(num_labels,m);
% now use the y as an index into the y_matrix to make everything ones
% there seems to be no neat way to do Y with multiple indices correctly
% Note this is not vectorized can't quite figure out how to do that.
for i=1:m
  Y(y(i),i) = 1;
endfor

% Unlike the theta calculation which is a true matrix multiple
% that is, you can see you iterate over an entire row multiplied by an entire
% column, the J function doesn't work that way, it is just a vector times a
% vector if you look at the summation, you do not see terms which vary along
% two variables.
% In the theta calculation the inner looks like
% A*B(X,Y) = sum(i=1,n;j=1,m) of % A(i,X)*B(Y,j)
% So this is why the .* works, this is Y which is num_labels rows and m columns
% while H is shaped the same so we want each y elecment and H element to be
% multiplied and then we sum like crazy
% Y is num_levels rows and m columns while H is m rows and num_level columns

cost= (-Y' .* log(H)) - ((1-Y') .* log(1-H));
% I can't find a simpler what to get the sum of the entire thing
% use the (:) trick so you resphae the matrix
J=sum(cost(:))/m;


% -------------------------------------------------------------

% REgularization cost function
% This is a mouthful, but basically is is the sum of the square of element
% of all the theta matrices. In this case, you do not include the ias term that
% is added so you have to leave out the first two columns of each matrix
% So for this is the Theta1 is 25 rows and 401 columns, so want to
% remove the 1st column which is this strange syntax matrix(:,2:end) which
% means take all the rows and then in the columns take the 2nd all the way to
% the need, so again you need to do a . operation and then sum by the number of
% dimensions.
% The first theta, remove the first column then do a square for each element
% then sum, here is another trick, if you add (:) to the end of a matrix,
% it converts it to a vector https://stackoverflow.com/questions/5817853/matrix-to-vector-conversion-in-matlab
% so then you nliy need a single sum
T1cost = sum(Theta1(:, 2:end)(:) .^ 2);
T2cost = sum(Theta2(:, 2:end)(:) .^ 2);
regularization = (lambda/(2*m))*(T1cost+T2cost);

J+=regularization;


% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];

% preallocate the Delta accumultors
Delta1=zeros(size(Theta1));
Delta2=zeros(size(Theta2));

% so for each training example
for t = 1:m
  % do the feed forward for one example
  % get the next row which is the training example t and the inputs for it.j
  % add the bias unit at the strt
  % Note that X has transposed X inputs so make a1 a column vectorç
  a1 = [ 1 ; X(t,:)' ];
  % in the text it is z2 = a1 * theta, but this doesn't
  % have the right dimensions Theta1 is hidden layers x (input layers + bias)
  % And a1 is the input layers, so want
  z2 = Theta1 * a1;
  % add bias unit and sigmoid
  a2 = [ 1 ; sigmoid(z2)];
  z3 = Theta2 * a2;
  a3 = sigmoid(z3);
  h = a3;

  % now do the back propagate for one example
  % so d3 is just the hypothesis less the prediction all done as column vectors
  % so output_layers rows x 1 column
  d3 = h - Y(:,t);
  % now backpropagate to the hidden layer using the derivative
  % The first term converts the output layer into the hidden layer
  % in this case from 10 to 26,
  % note that z2 is only 25 rows because it doesn't include the bias
  % so this actually means strip of the first row of the Theta2'*d3
  % Note we are going to get a matrix here, this makes
  d2= (Theta2' * d3)(2:end) .* sigmoidGradient(z2);

  % Now accumulate this error by taking the dot product of the
  % previous error and current layer valuesj
  % sense since we are about to modify the weights
  % so it should be the same shape as Theta2
  Delta2 += d3*a2';
  Delta1 += d2*a1';

endfor

% now we will have two gradients so roll them up
% os the (:) means Delta1 becomes a column vectors and so does Delta2
% You can concatenate them with the semicolon which adds more rows
% while a space adds more columns
% if you wanted a row vector instead, you have to translate them
% [ Delta1(:)' Delta2(:)' ]
% And make sure to take the average by dividing by m here
% so dJ/dTheta are these two matrices
D1 = Delta1 ./ m;
D2 = Delta2 ./ m;

% add regularization, non neede for the first column
% so make sure the first column is zeros
% Note that each column of the Theta matrix corresponds
% to the input side of that layer and the columns are the output side
D1 += lambda/m .* [ zeros(rows(Theta1),1) Theta1(:,2:end) ];
D2 += lambda/m .* [ zeros(rows(Theta2),1) Theta2(:,2:end) ];


% now roll them up into a single column vector
% they get unpacked by you called function
grad = [ D1(:); D2(:) ];

end

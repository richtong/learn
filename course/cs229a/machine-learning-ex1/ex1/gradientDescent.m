function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta.
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    % h is a column vector that is M long with each row being the errors for x(i)
    % X is m samples rows by n features in columns
    % with octave multiply m x n matrix by n column theta features settingsresults in
    % m column matrix when in each row, each column is multiplied together and
    % then added so you have x1 * theta1 + x2 * theta2 for every row
    % a property of octave is that if you have n row vector times an n row
    % column you get this dot product
    % but if you do it the other way, that is a n column times an n row, you get
    % instead an n x n matrix with each row of the first is multiplied by the
    % second and you get m x n matrix.
    % if you use the Wikipedia idea, it's easy to see why where the  A x B
    % is visually competed with the A on the left and B on top, so you should
    % have m rows of samples x n columns of features and then on the top you
    % have that which is n row x 1 column (a column vector), so you will end up iwth m row
    % then you will get m rows and 1 column where each row is calculated
    % correctl as the n elements in each row times the n elements in each
    % column, or the dot product.
    h = X * theta;
    % Now find the prediction error for each observation which is the hypothesis
    % minus the actual value y which generates an m row x 1 column matrix
    % aka a m row column-vector.
    predictionError = (h - y);
    % now converted prediction Error to a row vector, this is the real magic
    % so it is 1 row x m columns and X is m rows and n columns.
    % each product leaving a 1 row x n column which is the error. EAch of these
    % is calculated mechanically so when you see theta(j) - x^i(j) then you know
    % you need this matrix multiply that will leave you with the feature vector
    errorTerm = predictionError' * X;
    % Now scale the error for each feature by the step divided by rows
    % which gives you in effect the mean error
    change = (alpha/m) .* errorTerm';
    % you need thetanew because you want all thetas to change simultaneously
    thetanew = theta - change;
    theta = thetanew;

    % return this list of J's to the calling function so you
    % can check convergence by seeing J_history decrease over time for debugging
    J_history(iter) = computeCost(X, y, theta);

    end

    % ============================================================

    % Save the cost J in every iteration note yo don't actually need J to
    % compute the cost but this is for debugging

end

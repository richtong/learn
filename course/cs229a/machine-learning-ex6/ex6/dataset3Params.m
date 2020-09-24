function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and
%   sigma. You should complete this function to return the optimal C and
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example,
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using
%        mean(double(predictions ~= yval))

%
Cvec = [ 0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigmaVec = [ 0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
errorAll = zeros(length(Cvec),length(sigmaVec));

for Cindex = 1:length(Cvec)
  C=Cvec(Cindex);
  for sigmaIndex = 1:length(sigmaVec)
    sigma=sigmaVec(sigmaIndex);
    % Train the SVM
    fprintf("C=%f, sigma=%f: ", C, sigma);
    model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
    predictions = svmPredict( model, Xval );
    errorAll(Cindex, sigmaIndex) = mean(double(predictions ~= yval));
    fprintf("error=%f\n", errorAll(Cindex,sigmaIndex));
  endfor
endfor

% now find the minimum error isn't super obvious, but ind2sub maps a linear into
% the vector
% https://www.mathworks.com/matlabcentral/answers/74835-how-do-i-get-both-the-minimum-of-a-2d-matrix-and-it-s-indices
% convert error into a vector and find the minimum
% This retains the error matrix
[errorMin, errorIndex ] = min(errorAll(:));
[Cmin, sigmaMin] = ind2sub(size(errorAll), errorIndex);
C = Cvec(Cmin);
sigma = sigmaVec(sigmaMin);

disp("error matrix for all Cs and sigmas is");
errorAll

fprintf("minimum error %f found at C=%f and sigma=%f\n", errorMin, C, sigma);

% =========================================================================

end

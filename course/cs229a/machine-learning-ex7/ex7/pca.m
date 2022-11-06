function [U, S] = pca(X)
%PCA Run principal component analysis on the dataset X
%   [U, S, X] = pca(X) computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S
%

% Useful values
[m, n] = size(X);

% You need to return the following variables correctly.
U = zeros(n);
S = zeros(n);

% ====================== YOUR CODE HERE ======================
% Instructions: You should first compute the covariance matrix. Then, you
%               should use the "svd" function to compute the eigenvectors
%               and eigenvalues of the covariance matrix.
%
% Note: When computing the covariance matrix, remember to divide by m (the
%       number of examples).
%

% svd returns U which are the eigenvectors ordered by most significant
% S which is an diagonal matrix with each element being the variance of the
% corresponding eigenvector in U. Note U has these as row vectors
% V the last piece so you can rebuild the input with U*S*V'
%
Sigma = (X' * X) ./ m;

% note that the above is exactly the same as the cov functino
% we set it to 1 because we are not estimating
Sigma1 = cov(X,1);

%fprintf("Sigma should be same as\n")
%disp(Sigma);
%fprintf("cov(X)\n")
%disp(Sigma1);

[ U, S, V ] = svd(Sigma);


% =========================================================================

end

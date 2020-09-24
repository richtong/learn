function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1
%   vector of centroid assignments (i.e. each entry in range [1..K])
%


% Set K
K = size(centroids, 1);
%fprintf("K is %f\n", K);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

% https://stackoverflow.com/questions/2459851/octave-matlab-extend-a-vector-making-it-repeat-itself
% vectorize figure out the min X - centroids square error
% make K rows of X

%disp("size of X");
%size(X)
% Create a 3 dimensional set of Xs so we can vectorize
Xs = repmat(X, [ 1 1 K ]);

%disp("size of Xs");
%size(Xs)

% now change the centroid list so that each row is in a column this matches with
% reshape centroids so each dimension has a single centroid
% https://www.mathworks.com/help/matlab/ref/reshape.html
% note we need to transpose because reshape works column major
c = reshape(centroids', 1, columns(centroids), K );

%disp("size of c");
%size(c)


% the formula is realoy just the Euclidian norm squared
% https://en.wikipedia.org/wiki/Norm_(mathematics)
% https://scicomp.stackexchange.com/questions/8223/euclidean-distance-in-octave
delta = (Xs - c) .^ 2;
%disp("size of delta")
%size(delta)


% https://stackoverflow.com/questions/7163109/how-to-sum-columns-in-pairs-of-a-matrix-in-matlab
% what a cool trick to do pair-wiee addition by using the jumping of paramets
% trick

% the stride is not always going to be two it will actuall be the number of
% columns of the centroide
cost = sum(delta,2);

% now use min to find the index of the minimum
% https://stackoverflow.com/questions/45608349/octave-find-the-minimum-value-in-a-row-and-also-its-index
% you need a breakdown just across the third dimension
% note this is not going to be K, because we actually want the dimension
[ val, idx ] = min(cost,[], 3);


% =============================================================

end

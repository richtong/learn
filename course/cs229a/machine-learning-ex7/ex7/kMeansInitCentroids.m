function centroids = kMeansInitCentroids(X, K)
%KMEANSINITCENTROIDS This function initializes K centroids that are to be
%used in K-Means on the dataset X
%   centroids = KMEANSINITCENTROIDS(X, K) returns K initial centroids to be
%   used with the K-Means on the dataset X
%

% You should return this values correctly
centroids = zeros(K, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should set centroids to randomly chosen examples from
%               the dataset X
%


% https://www.coursera.org/learn/machine-learning/discussions/weeks/8/threads/XLl24URmEea1pw5frt5utw
% need to make sure you only pick unique points in X to start the centroids
X_unique = unique(X, 'rows');

% randperm generates a random permutation of the indices
all_random_rows = randperm(rows(X_unique));
random_rows= all_random_rows(1:K);

% select randomly
centroids = X_unique(random_rows,:);

% =============================================================

end

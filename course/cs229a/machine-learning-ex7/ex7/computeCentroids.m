function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%


% set the new centroids to the average position of all X's that belong to it

for k = 1:K
  % idx == k to get a bit vector of 1 if you want to select it
  % make sure to use the double equal otherwise you get assignment
  % find returns the indices of the 1s
  % use that vector of indices to select the appropriate Xs for that centroid
  % note, you need the : otherwise you will just select the first element
  Xcentroid = X(find(idx == k),:);
  % The equation mu(k) = sum(x(i where i belongs to Ck)/Ck is just the average
  % location, make sure you have the: otherwise
  centroids(k,:) = mean(Xcentroid);
endfor


% =============================================================

% the vectorized solution creates a matrix of selection from the idx
% wow this is super clever
% https://stackoverflow.com/questions/20527433/vectorize-octave-matlab-codes
% but the expression idx == 1:K means that it computes the bit vector idx==1,
% idx==2,... simply so you get the expanded matrix where 1 means select me
% you can use this with a matrix multiply to get the suitable rows of X
%
select_vector = (idx == 1:K);
% now you have only values of X and the magic here is that you are actually
% adding all the relevant coordinates as part of the matrix multiply
% so select_vector is b is a m rows by K columns
% And X is m rows by number of features n
% os b' times X is Kxm * m*n which gives a K rows with n features
% because you are doing a boolean, you are only selecting the right Xs and
% then the final operation is a sum across so you get the sum of it all
centroid_sum = (select_vector' * X);
% the sum of b is equal the the number of elements in each
% so sum(b) has K columns with the sum, we need transposed so we can do a
% dot divide
total_X_in_centroid = sum(select_vector);
centroid = centroid_sum ./ total_X_in_centroid';

end

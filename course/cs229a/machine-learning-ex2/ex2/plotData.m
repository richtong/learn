function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;
% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

% From the exercise
positives_indices = find(y == 1);
negatives_indices = find(y != 1 );
% k = marker and then the symbol
% then there are key value pairs
plot(X(positives_indices,1), X(positives_indices, 2), 'k+')
plot(X(negatives_indices,1), X(negatives_indices, 2), 'ko', 'MarkerFaceColor', 'y')

figure;
hold on;

% Rich's version uses matrices wrong X values wiped by 0 and 1
% Note this doesn't handle valid entries which are 0,0 there will be ones there
positives = X .* y;
% plot will only do X vx Y if it gets two vectors
plot(positives(:,1), positives(:,2), 'k+');

% use modulo to flip the 0s to 1s and 1s to 0s by incrementing
negatives = X .* mod(y+1,2);
plot(negatives(:,1), negatives(:,2), 'ko');
% =========================================================================



hold off;

end

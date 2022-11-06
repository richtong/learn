function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%
%   where pval is a probability between 0 and 1
%   and yval is either 0 indicating normal or 1 indicating anomolous
%   we need to find get the best prediction of  pval<bestEpsilon yval perfectly
%   by maximizing F1 = 2 * prec * rec /(prec + rec)
%   where prec(ision) = tp/(tp +fp) and rec(all) = tp/(tp + tn)
%   where tp = number of true positives, that is pval<epsilon && yval == 1
%   where fp = number of false positives, where pval < epsilong && yval == 0
%   where tn = number of true negatives, that is pval > epsilon && yval == 0
%   where fn = number of false negatives, that is pval > epsilon && yval == 1
%
bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;

    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions

% the first step in vectorization is to compute and array of epsilon values that
% are in columns across all the samples m
epsilon = min(pval):stepsize:max(pval);

    % =============================================================
    % Instead of this, use vectorized
%for epsilon = min(pval):stepsize:max(pval)
%    if F1 > bestF1
%       bestF1 = F1;
%       bestEpsilon = epsilon;
%    end
%end

% first vectorization, compare pval against all the epsilons
% Predictions is m rows of all samples and then 1,001 columns for each epsilon
Predictions = pval <= epsilon;
% as a check, at Predictions(end), you should have the value of m because
% every sample by definition is less than max(pval)
% true positives

% now for each column, return a true positive if you have a 1 for the Prediction
% and a one for y value, note we don't use the && operator, this compresses the
% matrices
% calculate as booleans
% Tp = (Predictions == 1) & (yval == 1)
% The alternative is to use matrix operations since these are boolean matrices
Tp = Predictions .* yval;
% Use the logical not
% https://www.mathworks.com/matlabcentral/answers/121087-how-to-use-invert-values-of-a-logical-array
% which is abbreviated with a tilde;

% True negatives are when Predictions and yval are both zero
Tn = ~Predictions .* ~yval;

% False positive means Prediction is on, but yval is false
Fp = Predictions .* ~yval;

% False negatives
Fn = ~Predictions .* yval;


% Now do the columnwise sum across all these to get the {true, false}
% {positives, negatives} for all epsilons

tp = sum(Tp);
fp = sum(Fp);
tn = sum(Tn);
fn = sum(Fn);

% as a check, the sum of all of these shold be the same as the number of rows

if (tp + fp + tn + fn ) ~= rows(yval)
  disp("error tp, fp and tn are not correct");
  tp + fp + tn + fn
end

% now calculate precision which is going to a row vector across
% all values of epsilon, precision should decline as epsilon increases
% because the number of false positives rise as epsion does
% should start 1 and delcine to zero
prec = tp ./ ( tp + fp);

% recall across all epsilon should increase because as epislon rises, the number
% false negatives will fall to zero as the epsilon rises until there are no
% false negatives It should start at basically zero and rise to 1 as fn goes to
% zero
rec = tp ./ (tp + fn);

% precision falls and recall rises so there should be a minimum point
F1 = 2 * (prec .* rec ./ (prec + rec));

% now look for the minimum F1
[bestF1, idx ] = max(F1);

bestEpsilon = epsilon(idx);

end

%
% helper function to create a i random rows for X and y
%
function [X_poly_sel, y_sel] = polySelect(X, y, i, p)
  perm = randperm(rows(X));
  X_sel = X(perm);
  y_sel = y(perm);
  X_sel = X_sel(1:i,:);
  y_sel = y_sel(1:i,:);
  X_poly_sel = polyFeatures(X_sel, p);
  X_poly_sel = featureNormalize(X_poly_sel);
  X_poly_sel = [ ones(rows(X_poly_sel),1) X_poly_sel ];
end

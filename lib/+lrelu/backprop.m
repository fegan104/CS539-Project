function dn = backprop(da,n,a,param)
%LRELU.BACKPROP Backpropagate derivatives from outputs to inputs

% Copyright 2012-2015 The MathWorks, Inc.

  dn = bsxfun(@times,da,(n >= 0) + lrelu.alpha .* (n < 0));
end

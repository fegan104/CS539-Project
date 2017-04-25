function d = da_dn(n,a,param)
%LRELU.DA_DN Derivative of outputs with respect to inputs

% Copyright 2012-2015 The MathWorks, Inc.

  d = double((n >= 0) + lrelu.alpha * (n < 0));
end

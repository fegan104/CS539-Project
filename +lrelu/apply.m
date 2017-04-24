function a = apply(n,param)
%LRELU.APPLY transfer function to inputs

% Copyright 2012-2015 The MathWorks, Inc.
  a = max(0,n) + lrelu.alpha * min(0, n);
  a(isnan(n)) = nan;
end

function da = forwardprop(dn,n,a,param)
%LRELU.FORWARDPROP Forward propagate derivatives from input to output.

% Copyright 2012-2015 The MathWorks, Inc.

  da = bsxfun(@times,dn,(n>=0) + lrelu.alpha * (n < 0));
end

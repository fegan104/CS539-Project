function a = lrelu(n,varargin)
%LRELU Leaky ReLU transfer function.

if ischar(n)
  a = nnet7.transfer_fcn(mfilename,n,varargin{:});
  return
end

% Apply
a = lrelu.apply(n);

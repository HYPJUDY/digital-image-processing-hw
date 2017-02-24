function out = f_mean(in, r)
% f_mean is a mean filter with a radius r.
% wide variety of O(N) time methods

A = box_filter(in, r); % unnormalized

% the number of pixels covered by the mean filter
B = box_filter(ones(size(in,1),size(in,2)), r); % divisor for normalization

out = A./B;

end

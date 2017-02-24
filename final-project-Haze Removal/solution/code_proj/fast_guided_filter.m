function q = fast_guided_filter(I, p, r, eps, s)
% fast guided image filtering
% Input: filtering input image p, guidance image I, radius r,
%        regularization eps
% Output: filtering output q.
% Algorithm 2. Fast Guided Filter.

% subsample (nearest-neighbor or bilinear)
I_ = imresize(I, 1/s, 'nearest');
p_ = imresize(p, 1/s, 'nearest');
r_ = r / s;

mean_I = f_mean(I_, r_);
mean_p = f_mean(p_, r_);
corr_I = f_mean(I_.*I_, r_);
corr_Ip = f_mean(I_.*p_, r_);

var_I = corr_I - mean_I.*mean_I;
cov_Ip = corr_Ip - mean_I.*mean_p;

a = cov_Ip./(var_I + eps);
b = mean_p - a.*mean_I;

mean_a = f_mean(a, r_);
mean_b = f_mean(b, r_);

% bilinearly upsample
mean_a = imresize(mean_a, [size(I, 1), size(I, 2)], 'nearest'); %bilinear
mean_b = imresize(mean_b, [size(I, 1), size(I, 2)], 'nearest');

% image I is the full-resolution guidance that is not downsampled
q = mean_a.*I + mean_b;
end
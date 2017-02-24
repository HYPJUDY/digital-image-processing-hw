function q = guided_filter(I, p, r, eps)
% guided image filtering using Algorithm 1. Guided Filter.
% 
% Input: guidance image I (greyscale/single channel),
%        filtering input image p (greyscale/single channel),
%        radius r,
%        regularization eps
% Output: filtering output q.

mean_I = f_mean(I, r);
mean_p = f_mean(p, r);
corr_I = f_mean(I.*I, r);
corr_Ip = f_mean(I.*p, r);

var_I = corr_I - mean_I.*mean_I;
cov_Ip = corr_Ip - mean_I.*mean_p;

a = cov_Ip./(var_I + eps);
b = mean_p - a.*mean_I;

mean_a = f_mean(a, r);
mean_b = f_mean(b, r);

q = mean_a.*I + mean_b;
end
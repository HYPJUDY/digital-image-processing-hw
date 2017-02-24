function out = box_filter(in, r)
% For each pixel in a grey-scale image(in), 
% calculate the sum of value (put it in 'out')
% within it in r (chessboard distance).
% 
% the (unnormalized) box filter can be efficiently computed
% in O(N) time using the integral image technique

[h, w] = size(in);
in = padarray(in, [r + 1, r + 1]); % padds the input with zeros
SAT = zeros(size(in)); % (padded)Summed Area Table
out = zeros(size(in)); % (padded)output

% ----------------- create a Summed Area Table ------------------- %
% the value at any point (x, y) in the summed area table is 
% the sum of all the pixels above and to the left of (x, y)
for x = 1 + r + 1 : h + 2 * (r + 1)
    for y = 1 + r + 1 : w + 2 * (r + 1)
        SAT(x, y) = in(x, y) + SAT(x - 1, y) + ...
            SAT(x, y - 1) - SAT(x - 1, y - 1);
    end
end

% --- evaluating the intensities over square area with radius r --- %
for x = 1 + r + 1 : h + r + 1
    for y = 1 + r + 1 : w + r + 1
        out(x, y) = SAT(x + r, y + r) + SAT(x - r - 1, y - r - 1) ...
            - SAT(x - r - 1, y + r) - SAT(x + r, y - r - 1);
    end
end

out = out(1 + r + 1 : 1 + r + h, 1 + r + 1 : 1 + r + w);

end

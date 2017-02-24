function [output_img] = mean_filter(input_img, filterLen, Q)
% The function applies spatial filtering on a gray scale image

% input_img: a gray image
% filterLen: the length of a filter
% Q: the order of the contraharmonic mean filter
% For positive values of Q it eliminates pepper noise.
% For negative values of Q it eliminates salt noise.
% Q = 0: arithmetic mean filter is used
% Q = -1: harmonic mean filter is used
%
% output_img: result of using filters

d = floor(filterLen / 2); % distance from center of the filter
[h, w] = size(input_img);
output_img = zeros(h, w);

% calculate the intensity for each pixel of output image
for r = 1:h
    for c = 1:w
        numerator = double(0);
        denominator = double(0);
        % iterate the square size of filter
        for i = (r - d):(r + d)
            for j = (c - d):(c + d)
                % avoid out of range
                if i >= 1 && i <= h && j >= 1 && j <= w
                    numerator = numerator + double(input_img(i, j))^(Q+1);
                    denominator = denominator + double(input_img(i, j))^Q;
                end
            end
        end
        output_img(r, c) = numerator / denominator;
    end
end
output_img = uint8(output_img);
end
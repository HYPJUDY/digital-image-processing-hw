function [output_img] = min_filter(input_img, filterLen)
% The function applies spatial filtering on a gray scale image

% input_img: a gray image
% filterLen: the length of a filter
%
% output_img: result of using geometric_mean_filter

d = floor(filterLen / 2); % distance from center of the filter
[h, w] = size(input_img);
output_img = zeros(h, w);
filter = zeros(filterLen, filterLen);
% calculate the intensity for each pixel of output image
for r = 1:h
    for c = 1:w
        % iterate the square size of filter
        for i = (r - d):(r + d)
            for j = (c - d):(c + d)
                % avoid out of range
                if i >= 1 && i <= h && j >= 1 && j <= w
                    filter(i+1-r+d, j+1-c+d) = double(input_img(i, j));
                end
            end
        end
        output_img(r, c) = min(filter(:));
    end
end
output_img = uint8(output_img);
end
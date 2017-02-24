function [output_img] = filter2d(input_img, filter, k)
% The function applies spatial filtering on a gray scale image

% input_img: a gray image
% filter: (averaging, Laplacian or high-boost) spatial filters
% k = 0: average filter is used
% k = -1: Laplacian filter is used
% otherwise: the weight of the mask back to the original image
%            used in high-boost filter
%
% output_img: result of using filters

if nargin < 3 % number of function input arguments < 3
    k = 0;   % set the default value of k to be -1
end

d = floor(size(filter, 1) / 2); % distance from center of the filter
h = size(input_img,1); % height of input&output
w = size(input_img,2); % width of input&output

% create output image that is the same size and data type as input
output_img = zeros(h, w);
output_img = cast(output_img, 'like', input_img);

% calculate the intensity for each pixel of output image
for r = 1:h
    for c = 1:w
        intensity = double(0);
        % iterate the square size of filter
        for i = (r - d):(r + d)
            for j = (c - d):(c + d)
                % avoid out of range
                if i >= 1 && i <= h && j >= 1 && j <= w
                    intensity = intensity + ...
                        filter(i - r + d + 1, j - c + d + 1) ...
                        * double(input_img(i, j));
                end
            end
        end
        switch k
            case 0 % average
                output_img(r, c) = intensity;
            case -1 % Laplacian
                output_img(r, c) = input_img(r, c) - intensity;
            otherwise % High-boost
                mask = input_img(r, c) - intensity;
                output_img(r, c) = input_img(r, c) + k * mask;
        end
    end
end
end
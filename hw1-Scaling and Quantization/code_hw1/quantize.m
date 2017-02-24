function [output_img] = quantize(input_img, level)
% The function takes a gray image and a target number of gray
% levels as input, and generates the quantized image as output.

% input_img: a gray image
% level: interger in [1,256] defining
%   the number of gray levels of output
%
% output_img: the quantized image

h_in = size(input_img,1); % height of input
w_in = size(input_img,2); % width of input

pixels_per_level = floor(256 / level);
interval_value(level > 1) = floor(255 / (level - 1));
interval_value(level == 1) = 0;
    
% create output image that is the same size and data type as input
output_img = zeros(h_in, w_in, size(input_img, 3));
output_img = cast(output_img, 'like', input_img);

% for each pixel in the output image
for r = 1:h_in
    for c = 1:w_in
        output_img(r,c) = floor(input_img(r,c) / pixels_per_level)...
            * interval_value;
    end
end
end
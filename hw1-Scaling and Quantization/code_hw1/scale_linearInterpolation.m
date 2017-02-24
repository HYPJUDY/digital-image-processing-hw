function [output_img] = scale_linearInterpolation(input_img, output_size)
% The function takes a gray image and a target size as input
% and generates the scaled image as output.
% Use bi-linear for interpolation

% input_img: a gray image
% output_size: [width height]: a target size
%
% output_img: the scaled image use bi-linear for interpolation

h_in = size(input_img,1); % height of input
w_in = size(input_img,2); % width of input
w_out = output_size(1); % width of output
h_out = output_size(2); % height of output

w_scaleFactor = w_in / w_out; % width scale factor
h_scaleFactor = h_in / h_out; % height scale factor

% create output image that is the same size and data type as input
output_img = zeros(h_out, w_out, size(input_img, 3));
output_img = cast(output_img, 'like', input_img);

% for each pixel in the output image
for i = 1:h_out % row
    for j = 1:w_out % columns
        % the point scale by ratio in input image
        r = i * h_scaleFactor;
        c = j * w_scaleFactor;
        
        % form a unit square
        r1 = floor(r);
        r2 = r1 + 1;
        c1 = floor(c);
        c2 = c1 + 1;
        
        % avoid out of range
        r1(r1 < 1) = 1;
        r1(r1 > h_in) = h_in;
        r2(r2 < 1) = 1;
        r2(r2 > h_in) = h_in;
        c1(c1 < 1) = 1;
        c1(c1 > w_in) = w_in;
        c2(c2 < 1) = 1;
        c2(c2 > w_in) = w_in;
            
        % bilinear interpolation formular
        output_img(j,i) = input_img(r1,c1) * (c2 - c) * (r2 - r) + ...
                          input_img(r1,c2) * (c - c1) * (r2 - r) + ...
                          input_img(r2,c1) * (c2 - c) * (r - r1) + ...
                          input_img(r2,c2) * (c - c1) * (r - r1);
    end
end
end

          
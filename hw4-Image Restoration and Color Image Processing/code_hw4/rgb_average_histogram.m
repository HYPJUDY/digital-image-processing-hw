function [imgOut] = rgb_average_histogram(rgbImage)
% input a rgb image and output a image equalized by
% the average histogram of the three channel

imgOut = zeros(size(rgbImage),class(rgbImage));
L = 256; % number of grey levels used
h = size(rgbImage,1); % height of input&output
w = size(rgbImage,2); % width of input&output
number_of_pixels = h * w;

% Calculate the histogram on each channel separately 
redChannel = rgbImage(:, :, 1);
greenChannel = rgbImage(:, :, 2);
blueChannel = rgbImage(:, :, 3);

cdf = zeros(256, 1);
equalized = zeros(256, 1);
histogram = zeros(256, 1);

for r = 1:h
    for c = 1:w
        histogram(redChannel(r, c) + 1) = ...
            histogram(redChannel(r, c) + 1) + 1;
        histogram(greenChannel(r, c) + 1) = ...
            histogram(greenChannel(r, c) + 1) + 1;
        histogram(blueChannel(r, c) + 1) = ...
            histogram(blueChannel(r, c) + 1) + 1;
    end
end

% compute an average histogram from these three histograms.
for i = 1:256
	histogram(i) = double(histogram(i)/3);
end

% Use the average histogram as the basis to obtain
% a single histogram equalization transformation.
count = 0;
for i = 1:size(histogram)
    count = count + histogram(i);
    cdf(i) = count / number_of_pixels;
    equalized(i) = round(cdf(i) * (L - 1));
end

% Apply this transformation to the R, G and B channels individually,
% and again rebuild an RGB image from the three processed channels.
for r = 1:h
    for c = 1:w
        imgOut(r, c, 1) = equalized(rgbImage(r, c, 1) + 1);
        imgOut(r, c, 2) = equalized(rgbImage(r, c, 2) + 1);
        imgOut(r, c, 3) = equalized(rgbImage(r, c, 3) + 1);
    end
end

end
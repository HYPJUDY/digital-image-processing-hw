close all;
% Histogram Equalization on Color Images
origin_rgb_img = imread('../hw4_input/06.png');
figure, imshow(origin_rgb_img), title('Original Image');
%% 2.4.1
R_equalized_img = equalize_hist(origin_rgb_img(:,:,1));
G_equalized_img = equalize_hist(origin_rgb_img(:,:,2));
B_equalized_img = equalize_hist(origin_rgb_img(:,:,3));
rebuild_rgb_img = cat(3, R_equalized_img, G_equalized_img, B_equalized_img);
figure, imshow(rebuild_rgb_img), title('rebuild rgb img');
imwrite(rebuild_rgb_img, '../hw4_output/rebuild_rgb_img.PNG','png');

%% 2.4.2
RGB_hist_img = rgb_average_histogram(origin_rgb_img);
figure, imshow(RGB_hist_img), title('RGB hist img');
imwrite(RGB_hist_img, '../hw4_output/RGB_hist_img.PNG','png');

%% 2.4.3
HSI_hist_img = HSI_hist(origin_rgb_img);
figure, imshow(HSI_hist_img), title('HSI hist img');
imwrite(HSI_hist_img, '../hw4_output/HSI_hist_img.PNG','png');
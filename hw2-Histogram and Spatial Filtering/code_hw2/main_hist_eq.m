origin_img = imread('E:\大三上\数字图像处理\06.png');
figure, imshow(origin_img);
title('Original Image');

origin_histogram = im_histogram(origin_img);
figure, bar(origin_histogram);
title('Origin Histogram');

histogram_equalized_img = equalize_hist(origin_img);
figure, imshow(histogram_equalized_img);
title('Histogram Equalized Image');

equalized_histogram = im_histogram(histogram_equalized_img);
figure, bar(equalized_histogram);
title('Equalized Histogram');

again_histogram_equalized_img = equalize_hist(histogram_equalized_img);
figure, imshow(again_histogram_equalized_img);
title('Histogram Equalized Again Image');

again_equalized_histogram = im_histogram(again_histogram_equalized_img);
figure, bar(again_equalized_histogram);
title('Equalized Again Histogram');

tf = isequal(equalized_histogram,again_equalized_histogram);
disp(tf);
% tf = 1 means that second pass of histogram equalization
% produce exactly the same result as the first pass

% figure; imhist(input_img,64);
% figure; imhist(output_img,64);



% I = imread('E:\大三上\数字图像处理\06.png');
% J = histeq(I);
% imshow(I)
% figure, imshow(J)
% figure; imhist(I,64)
% figure; imhist(J,64)
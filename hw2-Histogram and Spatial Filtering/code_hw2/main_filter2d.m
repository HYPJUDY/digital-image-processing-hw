input_img = imread('06.png');
figure, imshow(input_img);
title('Input Image');

averaging_3_filter = ones(3,3)/(3*3);
averaging_3_img = filter2d(input_img, averaging_3_filter);
figure, imshow(averaging_3_img);
title('3*3 Averaging Filter Image');

averaging_7_filter = ones(7,7)/(7*7);
averaging_7_img = filter2d(input_img, averaging_7_filter);
figure, imshow(averaging_7_img);
title('7*7 Averaging Filter Image');

averaging_11_filter = ones(11,11)/(11*11);
averaging_11_img = filter2d(input_img, averaging_11_filter);
figure, imshow(averaging_11_img);
title('11*11 Averaging Filter Image');

laplacian_3_filter = [1, 1, 1; 1, -8, 1; 1, 1, 1];
laplacian_3_img = filter2d(input_img, laplacian_3_filter, -1);
figure, imshow(laplacian_3_img);
title('3*3 Laplacian Filters Image, c = -1');

highboost_3_img = filter2d(input_img, averaging_3_filter, 3);
figure, imshow(highboost_3_img);
title('3*3 High-boost Filters Image, k = 3');
close all;
input_img = imread('../hw4_input/task_1.png');

% arithmetic mean filters
arithmetic_3_img = mean_filter(input_img, 3, 0);
figure, imshow(arithmetic_3_img);
title('3*3 arithmetic mean filter Image');
imwrite(arithmetic_3_img, '../hw4_output/arithmetic_3_img.png', 'png');

arithmetic_9_img = mean_filter(input_img, 9, 0);
figure, imshow(arithmetic_9_img);
title('9*9 arithmetic mean filter Image');
imwrite(arithmetic_9_img, '../hw4_output/arithmetic_9_img.png', 'png');

% harmonic mean filters
harmonic_3_img = mean_filter(input_img, 3, -1);
figure, imshow(harmonic_3_img);
title('3*3 harmonic mean filter Image');
imwrite(harmonic_3_img, '../hw4_output/harmonic_3_img.png', 'png');

harmonic_9_img = mean_filter(input_img, 9, -1);
figure, imshow(harmonic_9_img);
title('9*9 harmonic mean filter Image');
imwrite(harmonic_9_img, '../hw4_output/harmonic_9_img.png', 'png');

% contraharmonic mean filters
contraharmonic_3_img = mean_filter(input_img, 3, 1.5);
figure, imshow(contraharmonic_3_img);
title('3*3 contraharmonic mean filter Image');
imwrite(contraharmonic_3_img, '../hw4_output/contraharmonic_3_img.png', 'png');

contraharmonic_9_img = mean_filter(input_img, 9, 1.5);
figure, imshow(contraharmonic_9_img);
title('9*9 contraharmonic mean filter Image');
imwrite(contraharmonic_9_img, '../hw4_output/contraharmonic_9_img.png', 'png');

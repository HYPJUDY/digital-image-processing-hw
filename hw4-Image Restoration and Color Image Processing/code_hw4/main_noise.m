close all;
input_img = imread('../hw4_input/task_2.png');

%% gaussian noise
gaussian_noise_img = noise_generator(input_img, 'gaussian', 0, 40);
figure, imshow(gaussian_noise_img);
title('3*3 gaussian noise Image');
imwrite(gaussian_noise_img, '../hw4_output/gaussian_noise_img.png', 'png');

% arithmetic mean filter
gaussian_arithmetic_4_img = mean_filter(gaussian_noise_img, 4, 0);
figure, imshow(gaussian_arithmetic_4_img);
title('4*4 gaussian arithmetic mean filter Image');
imwrite(gaussian_arithmetic_4_img, '../hw4_output/gaussian_arithmetic_4_img.png', 'png');

% geometric mean filter
gaussian_geometric_3_img = geometric_mean_filter(gaussian_noise_img, 3);
figure, imshow(gaussian_geometric_3_img);
title('3*3 gaussian geometric mean filter Image');
imwrite(gaussian_geometric_3_img, '../hw4_output/gaussian_geometric_3_img.png', 'png');

% median filter
gaussian_median_5_img = median_filter(gaussian_noise_img, 5);
figure, imshow(gaussian_median_5_img);
title('5*5 gaussian median filter Image');
imwrite(gaussian_median_5_img, '../hw4_output/gaussian_median_5_img.png', 'png');



%% salt noise
salt_noise_img = noise_generator(input_img, 'salt & pepper', 0, 0.2);
figure, imshow(salt_noise_img);
title('3*3 salt noise Image');
imwrite(salt_noise_img, '../hw4_output/salt_noise_img.png', 'png');

% min filter
salt_min_3_img = min_filter(salt_noise_img, 3);
figure, imshow(salt_min_3_img);
title('3*3 salt min filter Image');
imwrite(salt_min_3_img, '../hw4_output/salt_min_3_img.png', 'png');

% harmonic mean filter
salt_harmonic_3_img = mean_filter(salt_noise_img, 3, -1);
figure, imshow(salt_harmonic_3_img);
title('3*3 salt harmonic mean filter Image');
imwrite(salt_harmonic_3_img, '../hw4_output/salt_harmonic_3_img.png', 'png');

% contraharmonic mean filter
salt_contraharmonic_3_img = mean_filter(salt_noise_img, 3, 1.5);
figure, imshow(salt_contraharmonic_3_img);
title('3*3 salt contraharmonic mean filter Image, Q=1.5');
imwrite(salt_contraharmonic_3_img, '../hw4_output/salt_contraharmonic_3_img.png', 'png');

salt_contraharmonic_3_img = mean_filter(salt_noise_img, 3, -5);
figure, imshow(salt_contraharmonic_3_img);
title('3*3 salt contraharmonic mean filter Image, Q=-5');
imwrite(salt_contraharmonic_3_img, '../hw4_output/salt_contraharmonic_3_img2.png', 'png');


%% salt-and-pepper noise
sp_noise_img = noise_generator(input_img, 'sp & pepper', 0.2, 0.2);
figure, imshow(sp_noise_img);
title('3*3 sp noise Image');
imwrite(sp_noise_img, '../hw4_output/sp_noise_img.png', 'png');

% arithmetic mean filter
sp_arithmetic_5_img = mean_filter(sp_noise_img, 5, 0);
figure, imshow(sp_arithmetic_5_img);
title('5*5 sp arithmetic mean filter Image');
imwrite(sp_arithmetic_5_img, '../hw4_output/sp_arithmetic_5_img.png', 'png');

% geometric mean filter
sp_geometric_3_img = geometric_mean_filter(sp_noise_img, 3);
figure, imshow(sp_geometric_3_img);
title('3*3 sp geometric mean filter Image');
imwrite(sp_geometric_3_img, '../hw4_output/sp_geometric_3_img.png', 'png');

% harmonic mean filter
sp_harmonic_3_img = mean_filter(sp_noise_img, 3, -1);
figure, imshow(sp_harmonic_3_img);
title('3*3 sp harmonic mean filter Image');
imwrite(sp_harmonic_3_img, '../hw4_output/sp_harmonic_3_img.png', 'png');

% median filter
sp_median_7_img = median_filter(sp_noise_img, 7);
figure, imshow(sp_median_7_img);
title('7*7 sp median filter Image');
imwrite(sp_median_7_img, '../hw4_output/sp_median_7_img.png', 'png');

input_img = imread('06.png');
% figure, imshow(input_img), title('Input Image');

tic
% dft  % Elapsed time is 19.038054 seconds
F_uv = dft2d(input_img, -1);
dft_img = display_spectrum(F_uv);
figure, imshow(dft_img), title('dft Image');

% idft
idft_img = dft2d(F_uv, 1);
figure, imshow(idft_img), title('idft Image');
toc

tic
% fft
F_uv = fft2d(input_img, -1);
fft_img = display_spectrum(F_uv);
figure, imshow(fft_img), title('fft Image');

%ifft
ifft_img = fft2d(F_uv, 1);
figure, imshow(ifft_img), title('ifft Image');
toc

% % filtering in the frequency domain
% tic % Elapsed time is 406.382247 seconds
% averaging_7_filter = ones(7,7)/(7*7);
% averaging_7_img = filter2d_freq(double(input_img), averaging_7_filter);
% figure, imshow(uint8(averaging_7_img));
% title('7*7 Averaging Filter Image');
% imwrite(uint8(averaging_7_img), 'averaging_7.png','png');
% toc

% tic  % Elapsed time is 420.946464 seconds
% laplacian_3_filter = [1, 1, 1; 1, -8, 1; 1, 1, 1];
% laplacian_3_img = filter2d_freq(double(input_img), laplacian_3_filter);
% figure, imshow(uint8(laplacian_3_img));
% title('3*3 Laplacian Filters Image');
% imwrite(uint8(laplacian_3_img), 'laplacian_3.png','png');
% toc

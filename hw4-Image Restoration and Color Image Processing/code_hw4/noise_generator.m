function output_img = noise_generator(input_img, flag, x, y)
% flag = 'gaussian': Gaussian white noise 
%                    with constant mean x and standard variance y
% flag = 'salt & pepper':  salt-and-pepper noise
%                    with the probabilities of each of the two noise
%                    components.[Pa(x) for pepper and Pb(y) for salt]

input_img = double(input_img(:,:,1)); % red channel
if strcmp(flag, 'gaussian')
    mean = x, STD = y;
    gaussian_noise = STD * randn(size(input_img)) + mean;
    output_img = gaussian_noise + input_img;
else strcmp(flag, 'salt & pepper')
    Pa = x, Pb = y;
    output_img = input_img;
    t = rand(size(input_img));
    output_img(find(t < Pa)) = 0; % pepper
    output_img(find(t >= Pa & t < Pa + Pb)) = 255; % salt
end
output_img = uint8(output_img);
end
function [imgOut] = HSI_hist(rgbImage)
% Convert the input image to the HSI color space, 
% and then perform histogram equalization on the intensity channel.
% Convert the result back to the RGB color space
rgbImage = im2double(rgbImage);
R = rgbImage(:, :, 1);
G = rgbImage(:, :, 2);
B = rgbImage(:, :, 3);

% --------- Convert the input image to the HSI color space --------- %
% H component
numerator = 0.5*((R-G)+(R-B));
denominator = sqrt((R-G).^2+(R-B).*(G-B)); % dot: element by element(not matrix)
theta = acos(numerator ./ (denominator+eps));
H = theta;
H(B > G) = 2*pi - H(B > G);

% saturation component
num = min(min(R, G), B); 
den = R + G + B; 
den(den == 0) = eps; 
S = 1 - 3.* num./den; 
H(S == 0) = 0; 

% intensity component
I = (R + G + B) / 3;


% ---- perform histogram equalization on the intensity channel ----- %
I = equalize_hist(round(I*255)); % parameter must be integer
I = I / 255;
% for test
% H = mean_filter(H, 16, 0);
% H = double(H);
% S = mean_filter(S, 16, 0);
% S = double(S);

% --------- Convert the result back to the RGB color space --------- %
% % new rgb channel
r = zeros(size(R));
g = zeros(size(R));
b = zeros(size(R));
% % RG sector(0<=H<120)
i = find((0 <= H) & (H < 2*pi/3));
b(i) = I(i) .* (1 - S(i));
r(i) = I(i) .* (1 + ((S(i).* cos(H(i))) ./ cos(pi/3-H(i)) ));
g(i) = 3*I(i) - (r(i) + b(i));

% GB sector(120<=H<240)
i = find((2*pi/3 <= H) & (H < 4*pi/3));
r(i) = I(i) .* (1 - S(i));
g(i) = I(i) .* (1 + ((S(i).*cos(H(i)-2*pi/3)) ./ cos(pi/3-(H(i)-2*pi/3))));
b(i) = 3*I(i) - (r(i) + g(i));

% BR sector(240<=H<=360)
i = find((4*pi/3 <= H) & (H <= 2*pi));
g(i) = I(i) .* (1 - S(i));
b(i) = I(i) .* (1 + ((S(i).*cos(H(i)-4*pi/3)) ./ cos(pi/3-(H(i)-4*pi/3))));
r(i) = 3*I(i) - (g(i) + b(i));


imgOut = cat(3, r, g, b);
% % TrueColor CData contains element out of range 0.0 <= value <= 1.0
imgOut = min(max(imgOut, 0), 1);
end
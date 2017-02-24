function output_img = filter2d_freq(input_img, filter)
[M,N] = size(input_img);
[m,n] = size(filter);

% obtain the padding parameters
P = 2*M;
Q = 2*N;

% form a padded image
% center its transform (do in the dft function)
fp_xy = zeros(P,Q);
for x = 1:M
    for y = 1:N
        fp_xy(x,y) = input_img(x,y)*(-1)^(x+y);
    end
end

% compute the DFT of the image
F_uv = dft(fp_xy);

% generate a real, symmetric filter function
% with center at coordinates (P/2, Q/2)
hp_xy = zeros(P,Q);
for x = 1:m
    for y = 1:n
        hp_xy(x,y) = filter(x, y)*(-1)^(x+y);
    end
end

% compute the DFT of the filter
H_uv = dft(hp_xy);

% array multiplication
G_uv = F_uv .* H_uv;


% obtain the processed image
gp_xy = real(idft(G_uv));
for x = 1:M
    for y = 1:N
    	if m == 3 % 3*3 Laplacian filter
    		gp_xy(x,y) = input_img(x,y) - gp_xy(x,y)*(-1)^(x+y);
    	else % averaging filter
	        gp_xy(x,y) = gp_xy(x,y)*(-1)^(x+y);
    	end
    end
end

output_img = gp_xy(1:M, 1:N);

end
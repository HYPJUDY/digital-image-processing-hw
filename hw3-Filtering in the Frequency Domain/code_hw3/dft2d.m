function output_img=dft2d(input_img,flags)
M = size(input_img,1); % height, rows
N = size(input_img,2); % width, columns

if flags == -1 % dft
    f_xy = double(input_img);
    % centralized
    for x = 1:M
        for y = 1:N
            f_xy(x,y) = f_xy(x,y) * (-1)^(x+y);
        end
    end
    output_img = dft(f_xy);
    
else % idft
    idft_img = idft(input_img);
    real_part_idft = real(idft_img);
    % decentralized
    for x = 1:M
        for y = 1:N
            real_part_idft(x,y) = real_part_idft(x,y) * (-1)^(x+y);
        end
    end
    output_img = uint8(real_part_idft);
end

end

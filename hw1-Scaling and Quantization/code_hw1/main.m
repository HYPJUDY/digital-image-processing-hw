input_img = imread('E:\大三上\数字图像处理\hw1\hw1_input\06.png');

operation_button = menu('Please choose an operation.', ...
      'Scaling', 'Quantization');

if operation_button == 1
    size_button = menu('Please choose an output size for scaling.',...
                       '192*128', '96*64', '48*32', '24*16', '12*8',...
                       '300*200','450*300','500*200');
    if size_button == 1
        output_size = [192 128];
    elseif size_button == 2
        output_size = [96 64];
    elseif size_button == 3
        output_size = [48 32];
    elseif size_button == 4
        output_size = [24 16];
    elseif size_button == 5
        output_size = [12 8];
    elseif size_button == 6
        output_size = [300 200];
    elseif size_button == 7
        output_size = [450 300];
    else
        output_size = [500 200];
    end
    
    output_img = scale_linearInterpolation(input_img,output_size);
    
    % figure;
    % imshow(input_img);
    % title('input image');
    figure;
    imshow(output_img);
    title(['output image with width ' num2str(output_size(1)),...
            ', height ' num2str(output_size(2))]);
    % write_dir = strcat('E:\大三上\数字图像处理\hw1\scale',...
        num2str(output_size(1)),'_',num2str(output_size(2)), '.png');
    % imwrite(output_img,write_dir)
else
    level_button = menu('Please choose an output size for scaling.',...
                       '128', '32', '8', '4', '2');
    if level_button == 1
        level = 128;
    elseif level_button == 2
        level = 32;
    elseif level_button == 3
        level = 8;
    elseif level_button == 4
        level = 4;
    else
        level = 2;
    end
    
    output_img = quantize(input_img, level);
    
    % figure;
    % imshow(input_img);
    % title('input image');
    figure;
    imshow(output_img);
    title(['output image with level ' num2str(level)]);
    % write_dir = strcat('E:\大三上\数字图像处理\hw1\quantization',...
        num2str(level), '.png');
    % imwrite(output_img,write_dir);
end

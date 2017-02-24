close all;

% smoothing, edge-preserving filtering
% the guide I is identical to the filtering input p.
tic
for photoName = {'baboon' 'beauty_with_freckle' 'boy' 'cat' 'lena'}
    I = double(imread(['.\dataset\img_smoothing\' char(photoName) '.bmp'])) / 255;
    for r = [2 4 8]
        for eps = [0.1^2 0.2^2 0.4^2]
            q = guided_filter(I, I, r, eps);
            %figure,imshow(q),title(['r=' num2str(r) ', eps=' num2str(eps)]);
            imwrite(q, ['output/img_smoothing/' char(photoName) '_' ...
                    num2str(r) '_' num2str(eps) '.bmp'],'bmp');
        end
    end
end
toc

% detail enhancement
tic
for photoName = {'bird' 'monarch' 'starynight' 'tomato' 'tulips'}
    I = double(imread(['.\dataset\img_enhancement\' char(photoName) '.bmp'])) / 255;
    p = I; % the input signal
    for r = [2 4 8 16]
        for eps = [0.1^2 0.2^2 0.4^2]
            q = zeros(size(I)); % base layer: p's edge-preserving smoothed
            q(:,:,1) = guided_filter(I(:,:,1), p(:,:,1), r, eps);
            q(:,:,2) = guided_filter(I(:,:,2), p(:,:,2), r, eps);
            q(:,:,3) = guided_filter(I(:,:,3), p(:,:,3), r, eps);

            d = p - q; % detail layer
            d_boosted = 5*d; % boosted detail layer
            p_enhanced = q + d_boosted; % enhanced signal

            %figure,imshow(p_enhanced),title(['r=' num2str(r) ', eps=' num2str(eps)]);
            imwrite(p_enhanced, ['output/img_enhancement/' char(photoName)...
                    '_' num2str(r) '_' num2str(eps) '.bmp'],'bmp');
        end
    end
end
toc


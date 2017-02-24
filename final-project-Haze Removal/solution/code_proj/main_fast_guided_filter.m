% Compare the running time of the faster guided filter to the original one

% ------------------------------ smoothing ---------------------------- %
% fast_guided_filter
tic % 时间已过 1.163830 秒。
for photoName = {'baboon' 'beauty_with_freckle' 'boy' 'cat' 'lena'}
    I = double(imread(['.\dataset\img_smoothing\' char(photoName) '.bmp'])) / 255;
    for r = [4 8 16]
        for eps = [0.1^2 0.2^2 0.4^2]
            s = 4;
            q = fast_guided_filter(I, I, r, eps, s);
        end
    end
end
toc

% guided_filter
tic % 时间已过 16.864427 秒。
for photoName = {'baboon' 'beauty_with_freckle' 'boy' 'cat' 'lena'}
    I = double(imread(['.\dataset\img_smoothing\' char(photoName) '.bmp'])) / 255;
    for r = [4 8 16]
        for eps = [0.1^2 0.2^2 0.4^2]
            q = guided_filter(I, I, r, eps);
        end
    end
end
toc
% ---------------------------------------------------------------------- %


% -------------------------- detail enhancement ------------------------ %
% fast_guided_filter
tic % 8.811079 s
for photoName = {'bird' 'monarch' 'starynight' 'tomato' 'tulips'}
    I = double(imread(['.\dataset\img_enhancement\' char(photoName) '.bmp'])) / 255;
    p = I; % the input signal
    for r = [4 8 16]
        for eps = [0.1^2 0.2^2 0.4^2]
            s = 4;
            q = zeros(size(I)); % base layer: p's edge-preserving smoothed
            q(:,:,1) = fast_guided_filter(I(:,:,1), p(:,:,1), r, eps, s);
            q(:,:,2) = fast_guided_filter(I(:,:,2), p(:,:,2), r, eps, s);
            q(:,:,3) = fast_guided_filter(I(:,:,3), p(:,:,3), r, eps, s);

            d = p - q; % detail layer
            d_boosted = 5*d; % boosted detail layer
            p_enhanced = q + d_boosted; % enhanced signal
        end
    end
end
toc

% guided_filter
tic % 127.631152 s
for photoName = {'bird' 'monarch' 'starynight' 'tomato' 'tulips'}
    I = double(imread(['.\dataset\img_enhancement\' char(photoName) '.bmp'])) / 255;
    p = I; % the input signal
    for r = [4 8 16]
        for eps = [0.1^2 0.2^2 0.4^2]
            q = zeros(size(I)); % base layer: p's edge-preserving smoothed
            q(:,:,1) = guided_filter(I(:,:,1), p(:,:,1), r, eps);
            q(:,:,2) = guided_filter(I(:,:,2), p(:,:,2), r, eps);
            q(:,:,3) = guided_filter(I(:,:,3), p(:,:,3), r, eps);

            d = p - q; % detail layer
            d_boosted = 5*d; % boosted detail layer
            p_enhanced = q + d_boosted; % enhanced signal
        end
    end
end
toc
% ---------------------------------------------------------------------- %

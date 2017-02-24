function output_img=fft2d(input_img,flags)
if flags == -1 % fft
    [h, w] = size(input_img);
    M = 2^nextpow2(h);
    N = 2^nextpow2(w);
    input_img = double(input_img);
    % input_img = im2double(input_img);
    f_xy = zeros(M,N);
    % centralized
    for x = 1:h
        for y = 1:w
            f_xy(x,y) = input_img(x,y) * (-1)^(x+y);
        end
    end
    output_img = fft(f_xy);
    
else % ifft
    [M, N] = size(input_img);
    MNf_xy_conj = fft(conj(input_img));
    f_xy = conj(MNf_xy_conj) / (M * N);
    idft_img = real(f_xy);
    % decentralized
    for x = 1:M
        for y = 1:N
            idft_img(x,y) = idft_img(x,y) * (-1)^(x+y);
        end
    end
    output_img = uint8(idft_img(1:256,1:384));
end

end


function F_uv=fft(f_xy)
[h, w] = size(f_xy);
M = 2^nextpow2(h);
N = 2^nextpow2(w);
K = N/2;
Feven_xv = zeros(M, K);
Fodd_xv = zeros(M, K);
F_xv = zeros(M, N);
Wk = exp(-1j*2*pi/K);
for v = 0:K-1
    for x = 0:M-1
        for y = 0:K-1
            Wk_vy = Wk^(v*y);
            Feven_xv(x+1,v+1)=Feven_xv(x+1,v+1)+f_xy(x+1,2*y+1)*Wk_vy;
            Fodd_xv(x+1,v+1)=Fodd_xv(x+1,v+1)+f_xy(x+1,2*y+1+1)*Wk_vy;
        end
        W2k_v = exp(-1j*2*pi*v/(2*K));
        F_xv(x+1,v+1) = Feven_xv(x+1,v+1) + Fodd_xv(x+1,v+1) * W2k_v;
        F_xv(x+1,v+K+1) = Feven_xv(x+1,v+1) - Fodd_xv(x+1,v+1) * W2k_v;
    end
end



K = M/2;
Feven_uv = zeros(K, N);
Fodd_uv = zeros(K, N);
F_uv = zeros(M, N);
Wk = exp(-1j*2*pi/K);
for u = 0:K-1
    for v = 0:N-1
        for x = 0:K-1
            Wk_ux = Wk^(u*x);
            Feven_uv(u+1,v+1)=Feven_uv(u+1,v+1)+F_xv(2*x+1,v+1)*Wk_ux;
            Fodd_uv(u+1,v+1)=Fodd_uv(u+1,v+1)+F_xv(2*x+1+1,v+1)*Wk_ux;
        end
        W2k_u = exp(-1j*2*pi*u/(2*K));
        F_uv(u+1,v+1) = Feven_uv(u+1,v+1) + Fodd_uv(u+1,v+1) * W2k_u;
        F_uv(u+K+1,v+1) = Feven_uv(u+1,v+1) - Fodd_uv(u+1,v+1) * W2k_u;
    end
end

end
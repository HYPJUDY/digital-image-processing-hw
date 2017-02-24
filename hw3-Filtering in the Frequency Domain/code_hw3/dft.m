function F_uv = dft(f_xy)
% input: 2-D (double) matrix f(x,y)
% output: 2-D discrete fourier transform F(u,v)

M = size(f_xy,1); % height, rows
N = size(f_xy,2); % width, columns

F_xv = zeros(M, N);
for v = 0:N-1
    for x = 0:M-1
        for y = 0:N-1
            F_xv(x+1,v+1)=F_xv(x+1,v+1)+f_xy(x+1,y+1)*exp(-1j*2*pi*v*y/N);
        end
    end
end

F_uv = zeros(M, N);
for u = 0:M-1
    for v = 0:N-1
        for x = 0:M-1
            F_uv(u+1,v+1)=F_uv(u+1,v+1)+F_xv(x+1,v+1)*exp(-1j*2*pi*u*x/M);
        end
    end
end

end
function f_xy=idft(F_uv)
% input: 2-D discrete fourier transform F(u,v)
% output: inverse discrete fourier transform f(x,y)

[M,N]=size(F_uv);
MNf_xy_conj = dft(conj(F_uv));
f_xy = conj(MNf_xy_conj) / (M * N);

end
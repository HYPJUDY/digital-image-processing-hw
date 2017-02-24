function spectrum = display_spectrum(F_uv)
% calculate Fourier transform and its spectrum of an image
spectrum = abs(F_uv);
% calculate log transformation of the spectrum
spectrum = log(spectrum+1);
% scaling
max_value = max(max(spectrum));
min_value = min(min(spectrum));
spectrum = (spectrum - min_value)/(max_value-min_value);

end
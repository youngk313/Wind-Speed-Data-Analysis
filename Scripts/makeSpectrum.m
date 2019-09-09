function [freq, spectra] = makeSpectrum(x,fs)
%Takes a time series, x, with sampling frequency, fs, and 
%generates the power spectral density.


spectra = abs(fft(x)).^2/(length(x)*fs);
spectra = 2*spectra(1:length(spectra)/2+1);
freq = linspace(0,fs/2,length(spectra));
end


function [Kfreq, Kspectra] = makeMeanSpectrum(x,fs,K)
%Takes a time series, x, with sampling frequency, fs, and 
%generates the mean spectrum of the signal split into K parts


N = floor(length(x)/K)

x = x(1:floor(length(x)/N)*N);
Kspectra = zeros(N,1);
for i=1:K
    Kspectra = Kspectra + ...
        1/K*1/(N*fs)*abs(fft(x(((i-1)*N+1):i*N)).^2);
end
Kspectra = 2*Kspectra(1:length(Kspectra)/2+1);
Kfreq  =linspace(0,fs/2,length(Kspectra));
end


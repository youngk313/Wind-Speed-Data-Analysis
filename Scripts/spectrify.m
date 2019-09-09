function [energyspect, f] = spectrify(ts,deltat)
freq = 1/deltat;
freqnyq = freq/2;


N = length(ts);
deltaf = freqnyq/(N/2);
spect = fft(ts);
energyspect = abs(spect).^2./(N*freq);
energyspect = energyspect(1:N/2+1);
f = 0:deltaf:freqnyq;
end





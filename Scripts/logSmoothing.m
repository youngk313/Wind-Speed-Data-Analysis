function [specSmooth, freqSmooth, binPoints] = logSmoothing(x,y,nbins)
%takes power spectral data, x (frequencies) and y (spectrum) 
%and filters the spectrum by taking the average over logarithmically
%spaced frequency bins.

bins = logspace(-6,2,nbins*8);
for i = 1:length(bins)-1
    binPoints = (x>bins(i)) & (x<bins(i+1));
    specSmooth(i) = mean(y(binPoints));
    freqSmooth(i) = bins(i) + 10^(-0.5)*(bins(i+1)-bins(i));
end


freqSmooth = freqSmooth(~isnan(specSmooth));
specSmooth = specSmooth(~isnan(specSmooth));

end


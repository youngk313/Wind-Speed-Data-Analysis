close all;
clear all;
%%
%Assignment 3 Spectral Analysis
winds = load('sonic1u10Hz.dat');
%filter the data anomalies
winds=winds(winds < 32);
%calculate the mean and variance 
uave = mean(winds);
uvar = var(winds);
ustd = sqrt(uvar);
ufluc = winds -  uave;
%inspect wind data
plot(winds);
title('Time Series of Wind Speeds');
xlabel('Time (s)');
ylabel('Wind speed (m/s)');

figure
plot(ufluc);
title('Fluctuations in Wind Speeds');
xlabel('Time (s)');
ylabel('u''(t)');
%%
%Spectral Conversion
[uhist x] = hist(winds,50);
figure
histogram(ufluc,50,'Normalization','probability');
N = length(ufluc);


Nbin = 20\;

K = 20;
deltat = 7200/(N*K);
tsize = floor(N/K);
smallts = zeros(K,tsize);
specthold = [];
figure
for countk = 1:K
    
    smallts(countk,:) = ufluc(1+(countk-1)*tsize:countk*tsize);
    [specthold(countk,:), f] = spectrify(smallts(countk,:),deltat);
    subplot(K,1,countk);
    plot(smallts(countk,:));
   
    a = log10(min(f(2:end)));
    b = log10(max(f));
    [fsmooth, specsmooth] = smoother(Nbin, a, b, f,specthold(countk,:));

end

%%
meanspect = sum(specthold,1)/K;
vart = 2*trapz(f,meanspect);
figure
loglog(f,f.*meanspect);
    a = log10(min(f(2:end)));
    b = log10(max(f));
    [fsmooth, specsmooth] = smoother(Nbin, a, b, f,meanspect);
    hold on
    plot(fsmooth,fsmooth.*specsmooth);
    hold off
    fsmooth
    f
2*trapz(fsmooth,specsmooth)
%spectra of the autoregressive time series
alpha = 0.9;
deltat = 0.1;
auto = tseries(100000,alpha);
[spectauto, fauto] = spectrify(auto,deltat);
figure
loglog(fauto, fauto.*spectauto);
  a = log10(min(fauto(2:end)));
    b = log10(max(fauto));
    [fsmooth, specsmooth] = smoother(Nbin, a, b, fauto,spectauto);
    hold on
    plot(fsmooth,fsmooth.*specsmooth);
    hold off
%%
%X = tseries(7200,
%figure

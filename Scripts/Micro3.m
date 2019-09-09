%Micrometeorology 
%Assignment 3 - Power spectral density
%Jaime Liew
data = load('sonic1u10Hz.dat');
data = data(data<32);
data = data - mean(data);
plot(data)
% 
% %Sprog data
% data = load('SprogData.mat');
% data = data.data(:,2);
% data = data(data < 40);
% 
% data = autoRegProcess(100000,0.9);
%% Make the spectrum.
fs = 10; %Hz - Sampling frequency
omega = fs * 2 * pi; %Rad/s - Sampling frequency

[freq, spectra] = makeSpectrum(data,fs);

Var = var(data)
trapz(freq,spectra);

nbins = 15;
[specSmooth, freqSmooth] = logSmoothing(freq,spectra,nbins);
P = polyfit(log(freqSmooth(45:end)),log(specSmooth(45:end)),1);
P
%% Splitting the signal into bins of size K
K = 20; %split signal into K groups
[Kfreq, Kspectra] = makeMeanSpectrum(data,fs,K);
%% Plot

close all
figure
loglog(freq,spectra)
hold on

loglog(Kfreq,Kspectra)
loglog(freqSmooth,specSmooth,'linewidth',1)
LINEX = linspace(0.1,fs/2,10);
LINEY = exp(P(2))*LINEX.^(P(1));
loglog(LINEX,LINEY,'--')
xlabel('Frequency [rad/s]')
ylabel('S_x(\omega)')
axis('tight')
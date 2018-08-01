% Reconstruction from recurrent nonuniform sampling
clear
Order = 100; % Bandpass filter order
nseg = 200; % Number of samples of each ADC
M = 3; % Number of ADCs
N = M*nseg; % Total number of samples
NN = N*10;
freq = 3.4;
qfreq = 0.4; % folded-down frequency
nfreq = freq/10; % normalized frequency for the bandpass filter
xorig = cos(2*pi*freq*(0.1)*(0:NN-1)+sin(2*pi*0.001*(0:NN-1))); % Signal sampled at every 0.1 second
rm = [0 0.05 0.05]; % rm is the nonuniform sampling ratio
am =[];
for q = 1:nseg,
    am = [am,rm];
end
% Generate a nonuniformly sampled signal sampled at every 1 second
for n = 1:N,
    y(n) = cos(2*pi*(n-1+am(n))*freq+sin(2*pi*0.01*(n-1+am(n))));
end
h = fir1(Order, [2*qfreq-0.05, 2*qfreq+0.05], 'band'); % Design of the bandpass filter to get rid of side lobes
yr = conv(h,y); % Filtering
yr = yr(Order/2+1:N+Order/2); % To get rid of transitional samples
yup = upsample(yr,10); % Upsample by 10 for interpolation
h = fir1(Order, [2*nfreq-0.005, 2*nfreq+0.005], 'band'); % Design of the banpass filter for interpolation
yrecon = conv(h,yup); % Filtering
yrecon = 10*sqrt(2)*yrecon(Order/2+1:N*10+Order/2); % To get rid of transitioanl samples
XO = abs(fft(xorig)); % DFT of the true spectrum
subplot(311), plot(0:1/N:5, XO(1:NN/2+1)) % True DFT
xlabel('Frequency')
ylabel('Amplitude');
title('(a) True Spectrum(Uniformly sampled)')
Y = abs(fft(y));
subplot(312), plot(0:1/N:0.5, Y(1:N/2+1))  % Nonuniform DFT
xlabel('Frequency')
ylabel('Amplitude');
title('(b) Folded-down Spectrum(Noniniformly sampled)')
YR = abs(fft(yrecon)); % DFT of the reconstructed signal
subplot(313), plot(0:1/N:5, YR(1:NN/2+1)) % Reconstructed
xlabel('Frequency')
ylabel('Amplitude');
title('(c) Reconstructed Spectrum')
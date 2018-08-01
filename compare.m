% Reconstruction from recurrent nonuniform sampling using Zenq's method.
clear
Order = 100; % Bandpass filter order
nseg = 1000;
M = 3;
N = M*nseg;
N=600; % Number of samples
freq=0.45;% Frequency 0.3, 0.7, 1.3, 2.7, 3.3, 3.7, etc.
rm=[0 0.05 0.05]; % Nonuniform sampling ratio
am=[];
% Nonuniform sampling ratio for 1000 samples
for n=1:N/3,
    am=[am,rm];
end
am=[am,0]; % Pad zero to the 1000-th sampling
% Generate a uniformly sampled signal
x=sin(2*pi*freq*(0:N/2));
% Generate a nonuniformly sampled signal
for n=1:N,
    y(n)=cos(2*pi*freq*(n-1+am(n))); % Nonuniform sampling
  
end
% True DFT
subplot(311), plot(abs(fft(x)));
title('Spectrum of Uniformly sampled signal');
% Nonuniform DFT
subplot(312), plot(abs(fft(y)));
 title('Spectrum of Nonuniformly sampled signal');
% Bandpass filter
h=fir1(Order, [2*freq-0.05, 2*freq+0.05], 'band');
% Filtering
yr=conv(h,y);
yr=yr(Order/2+1:N+Order/2);
subplot(313), plot(abs(fft(yr)));
title('Reconstructed Nonuniformly sampled signal');

% To calculate the spectrum of the nonuniformly sampled signal
N=600; % Number of samples
freq=0.1; % Frequency 0.3, 0.7, 1.3, 2.7, 3.3, 3.7, etc.
rm=[0 0.05 0.05]; % Nonuniform sampling ratio
am=[];
% Nonuniform sampling ratio for 600 samples
for n=1:N/3,
    am=[am,rm];
end
for n=1:N,
    xn(n)=cos(2*pi*freq*(n-1+am(n))); % Nonuniform sampling
end
XN=abs(fft(xn,6000)); % Magnitude spectrum
XN=XN(1:(N*10)/2);
stem(0:1/(N*10):((N*10)/2-1)/6000, XN) % Plot of spectrum
title(freq)
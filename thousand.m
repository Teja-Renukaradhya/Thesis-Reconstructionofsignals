%generate the noisy signal which will be filtered
y= cos(2*pi*300/1000*(1:2000));


%x = (x + 0.5*filtered_noise(500:500+length(x)-1))/length(x)*2;
% This script is available at https://dadorran.wordpress.com search for
% filtering matlab demo
figure(1);
plot(y)
title('cosine signal')
xlabel('Samples');
ylabel('Amplitude')
x=upsample(y,2);
figure(2);
plot(x)
title('upsampled signal')
xlabel('up_Samples');
ylabel('Amplitude')
x(end) = [];
%[b a] = fir1(2,[0.6 0.7],'bandpass');
%filtered_noise = filter(b,a,randn(1, length(x)*2));
 
%plot magnitude spectrum of the signal
X_mags = abs(fft(x));
figure(3)
plot(X_mags)
xlabel('DFT Bins')
ylabel('Magnitude')
 
%plot first half of DFT (normalised frequency)
num_bins = length(X_mags);
figure(4);
plot([0:1/(num_bins/2 -1):1], X_mags(1:num_bins/2))
xlabel('Normalised frequency (\pi rads/sample)')
ylabel('Magnitude')
 
%design a second order filter using a butterworth design technique 
[b a] = fir1(2, 0.7, 'high')
 
%Show the signal flow diagram of the filter/system
%this function available from https://dadorran.wordpress.com
% create_signal_flow(b,a) 
 
%plot the frequency response (normalised frequency)
H = freqz(b,a, floor(num_bins/2));
hold on
figure(5);
plot([0:1/(num_bins/2 -1):1], abs(H),'r');
 
%filter the signal using the b and a coefficients obtained from
%the butter filter design function
x_filtered = filter(b,a,x);
 
%plot the filtered signal
figure(6)
plot(x_filtered,'r')
title('Filtered Signal - Using Second Order Butterworth')
xlabel('Samples');
ylabel('Amplitude')
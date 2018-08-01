close all; clear all; clc;

t = [0:0.02:1];
x = sin(4*pi*t);
subplot(4,1,1);
plot(t,x);
title('Continuous signal to be sampled,x(t)');
xlabel('Time(t)');
ylabel('Amplitude');
%sampling
subplot(4,1,2);
stem(t,x,'r');
title('Sampled signal');
xlabel('Samples(n)');
ylabel('Amplitude');
% function upsample adds zeros
y = upsample(x,2);

ty = [0:0.01:1.01];

subplot(4,1,3);
stem(ty, y, 'or');
title('Upsampled signal by a factor of 2');
xlabel('Samples(n)');
ylabel('Amplitude');
%hold on;
%stem(t, x);
% function downsample adds zeros
y = downsample(x,2);

ty = [0:0.04:1.01];

subplot(4,1,4);
stem(ty, y, 'or');
title('Downmpled signal by a factor of 2');
xlabel('Samples(n)');
ylabel('Amplitude');
%hold on;
%stem(t, x);


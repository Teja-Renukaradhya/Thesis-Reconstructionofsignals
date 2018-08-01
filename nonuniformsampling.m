clc;close all;clear all;
fm=5;
t=0:0.0005:1;
x=cos(2*pi*fm*t);
subplot(2,1,1);
plot(t,x);
title('Signal to be sampled,x(t)');
xlabel('Time(t)');
ylabel('Amplitude');
%undersampling
%fs1=1.5*fm;
t1=[0,0.12,0.37,0.41,0.56,0.69,0.88,1];
x1=cos(2*pi*fm*t1);
subplot(2,1,2);
plot(t,x,'b')
hold on;
stem(t1,x1,'r');
title('Non-uniform sampling');
xlabel('Samples(n)');
ylabel('Amplitude');
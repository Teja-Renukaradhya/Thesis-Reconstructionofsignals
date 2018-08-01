clc;close all;clear all;
fm=5;
t=0:0.0005:1;
x=cos(2*pi*fm*t);
subplot(4,1,1);
plot(t,x);
title('Signal to be sampled,x(t)');
xlabel('Time(t)');
ylabel('Amplitude');
%undersampling
fs1=1.5*fm;
t1=0:1/fs1:1;
x1=cos(2*pi*fm*t1);
subplot(4,1,2);
plot(t,x,'b')
hold on;
stem(t1,x1,'r');
title('Sub-Nyquist sampling');
xlabel('Samples(n)');
ylabel('Amplitude');
%normalsampling
fs2=2*fm;
t2=0:1/fs2:1;
x2=cos(2*pi*fm*t2);
subplot(4,1,3);
plot(t,x,'b')
hold on;
stem(t2,x2,'r');
title('Nyquist sampling');
xlabel('Samples(n)');
ylabel('Amplitude');
%oversampling
fs3=10*fm;
t3=0:1/fs3:1;
x3=cos(2*pi*fm*t3);
subplot(4,1,4);
plot(t,x,'b')
hold on;
stem(t3,x3,'r');
title('Oversampling');
xlabel('Samples(n)');
ylabel('Amplitude');

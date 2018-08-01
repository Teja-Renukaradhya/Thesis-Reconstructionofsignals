N=9999;
r=[0, 0.1,0.1];
freqinc=2*pi/N;
freq=1.3*2*pi;
for n=1:N,
    w(n)=freqinc*(n-1)-freq;
end
x1=sin(w*N/2);
x2=sin(w*0.5);
x3=sin(w*1.5);
x=x1./x2;
xh=x1./x3;
y=(1+exp(j*freq*r(2))*exp(-j*w)+exp(j*freq*r(3))*exp(-j*2*w));
z=xh.*y;
subplot(411), plot((0:N-1)/N,abs(x)/10000)
title('X(theta)')
xlabel('Normalized frequency')
ylabel('Amplitude');
subplot(412), plot((0:N-1)/N,abs(xh)/3333)
title('P(theta)')
xlabel('Normalized frequency')
ylabel('Amplitude');
subplot(413), plot((0:N-1)/N,abs(y)/3)
title('Q(theta)')
xlabel('Normalized frequency')
ylabel('Amplitude');
subplot(414), plot((0:N-1)/N,abs(z)/10000)
title('Xnon(theta)')
xlabel('Normalized frequency')
ylabel('Amplitude');
q=exp(j*freq*r);
Q=fft(q);
abs(Q)
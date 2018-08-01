% This calculates the exact side lobe to main lobe ratio
r=[0, 0.05, 0.05];  % nonuniform sampling ratios
freq=2*pi*1.3;  % normalized frequency
s=exp(j*freq*r);
S=fft(s);  % computation of gains of lobes
Q=abs(S);  % magnitude of gains
stem(0:2, Q)
xlabel('Frequency')
ylabel('Amplitude');
ratio=(Q(2)+Q(3))/Q(1)/2% ratio of side to main lobes
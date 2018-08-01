r=[0, 0.05, 0.05];  	% nonuniform sampling ratios
freq=2*pi*50/200;  	% normalized frequency
s=exp(j*freq*r);
S=fft(s);  		% computation of gains of lobes
Q=abs(S);  		% magnitude of gains
stem(0:2, Q)
ratio=Q(2)/Q(1)  	% ratio of side to main lobes

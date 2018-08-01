% To calculate the spectrum of the nonuniformly sampled signal
N=1000; % Number of samples
freq=0.3333; % Frequency 0.3, 0.7, 1.3, 2.7, 3.3, 3.7, etc.
rm1=[0 0.05 0.05 0.05]; % Nonuniform sampling ratio two
am1=[];
% Nonuniform sampling ratio for 1000 samples
for n=1:250,
    am1=[am1,rm1];
end
%am1=[am1]; % Pad zero to the 999th and 1000-th sampling

rm2=[0 0.05 0.05]; % Nonuniform sampling ratio
am2=[];
% Nonuniform sampling ratio for 1000 samples
for n=1:333,
    am2=[am2,rm2];
end
am2=[am2,0]; % Pad zero to the 1000-th sampling

for n=1:N,
    xn1(n)=cos(2*pi*freq*(n-1+am1(n))); % Nonuniform sampling
end
XN1=abs(fft(xn1)); % Magnitude spectrum
XN1=XN1(1:N/2);
%figure (1);
%plot(0:0.001:(N/2-1)/N, XN1)
%title(freq)

for n=1:N,
    xn2(n)=cos(2*pi*freq*(n-1+am2(n))); % Nonuniform sampling
end
XN2=abs(fft(xn2)); % Magnitude spectrum
XN2=XN2(1:N/2);
%figure(2);
%plot(0:0.001:(N/2-1)/N, XN2) % Plot of spectrum  
%title(freq)


a=numel(findpeaks(XN2));
%b=numel(findpeaks(XN2));
if(a==3)
   plot(0:0.001:(N/2-1)/N, XN2)
    title(freq)
else
    plot(0:0.001:(N/2-1)/N, XN1)
    title(freq)
end
    


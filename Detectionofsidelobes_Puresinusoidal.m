% To calculate the spectrum of the nonuniformly sampled signal
N=600; % Number of samples
freq=3.4;% Frequency 0.3, 0.7, 1.3, 2.7, 3.3, 3.7, etc.
rm=[0 0.05 0.05]; % Nonuniform sampling ratio
am=[];
% Nonuniform sampling ratio for 1000 samples
for n=1:N/3,
    am=[am,rm];
end
am=[am,0]; % Pad zero to the 1000-th sampling
for n=1:N,
    xn(n)=cos(2*pi*freq*(n-1+am(n))); % Nonuniform sampling
end
pad=6000;
XN=abs(fft(xn,pad)); % Magnitude spectrum
%XN=abs(fft(xn));
XN=XN(1:3000);
%subplot(3,1,1);
%plot(XN)
%title('Magnitude Spectrum FFT')
XN=XN(1:(N*10)/2);
subplot(2,1,1);
plot(0:1/(N*10):((N*10)/2-1)/6000, XN) % Plot of spectrum
title(['Spectra of nonuniformaly sampled pure sinusoidal signal, ',num2str(freq),' (Test Ratio)']);
xlabel('Normalized frequency')
ylabel('Amplitude');

%finding peaks and location to calculate approximate ratio
[pks,locs] = findpeaks(abs(XN));
[maxvalue, index_of_max] = max(XN);
A=[pks;locs]
main_lobe=max(XN); 	%Value of main lobe
theta_nod=index_of_max/pad;%main lobe frequency
     
if (freq==0.1);
  SL1=(-theta_nod+1/3)*pad; 
  SL2=(theta_nod+1/3)*pad; 
  
elseif (freq==0.2);
  SL1=(-theta_nod+1/3)*pad;
  SL2=(-theta_nod+2/3)*pad;
else
SL1=(-theta_nod+2/3)*pad;%calculated side lobe location
if(SL1>=(pad/2));
   m=SL1-(pad/2);
   SL1=(pad/2)-m;
end
SL2=(-theta_nod+1/3)*pad;
end


[~,I1] = min(abs(locs-abs(SL1)));%choosing closest existing value to the calc sidelobe loc
c1 = locs(I1);
[~,I2] = min(abs(locs-abs(SL2)));
c2 = locs(I2);
[row1, column1] = find(A == c1)
[row2, column2] = find(A == c2)
sidelobe_1=pks(column1);
sidelobe_2=pks(column2);

if(abs((index_of_max) -(c1)) < (0.1*N));
 approximateratio=sidelobe_2/maxvalue; 
 disp(approximateratio);
else
approximateratio=((sidelobe_1+sidelobe_2)/2)/maxvalue;
disp(approximateratio);
end





%sidelobe
% This calculates the exact side lobe to main lobe ratio
r=[0, 0.05, 0.05];  % nonuniform sampling ratios
nf=2*pi*freq;  % normalized frequency
s=exp(j*nf*r);
S=fft(s);  % computation of gains of lobes
Q=abs(S);  % magnitude of gains
subplot(2,1,2);
stem(0:2, Q)
title(['Magnitude Plot of Exact main lobe and side lobe, ',num2str(freq),' (Reference Ratio)']);
xlabel('Normalized frequency')
ylabel('Amplitude');
exactratio=(Q(2)+Q(3))/Q(1)/2% ratio of side to main lobes



%error percentahe
ep=((exactratio-approximateratio)/exactratio)*100
disp(sprintf('Error Percentage: %f and Test Ratio: %f and Reference Ratio: %f \n Error Percentage %f', ep, approximateratio, exactratio, abs(ep)))



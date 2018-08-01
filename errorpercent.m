% To calculate the spectrum of the nonuniformly sampled signal
N=1000; % Number of samples
freq=3.1 % Frequency 0.3, 0.7, 1.3, 2.7, 3.3, 3.7, etc.
rm=[0 0.05 0.05]; % Nonuniform sampling ratio
am=[];
% Nonuniform sampling ratio for 1000 samples
for n=1:333,
    am=[am,rm];
end
am=[am,0]; % Pad zero to the 1000-th sampling
for n=1:N,
    xn(n)=cos(2*pi*freq*(n-1+am(n))); % Nonuniform sampling
end
XN=abs(fft(xn)); % Magnitude spectrum
XN=XN(1:N/2);
plot(0:0.001:(N/2-1)/N, XN,'green') % Plot of spectrum  
title(freq)
%title('DFT spectrum')
%a=numel(findpeaks(XN));

pks = findpeaks(XN)
[pks,locs] = findpeaks(XN)
[pks,locs,w,p] = findpeaks(XN)

%error percentage

if(numel(locs)==1 || numel(locs) ==3)
  freq2 = locs(ceil(end/2));
     else 
        freq2 = locs(end);
end

errorp = (((freq2/1000)-freq)/freq )*100;

disp (errorp);

    



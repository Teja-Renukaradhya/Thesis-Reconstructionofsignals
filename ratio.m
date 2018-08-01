function ratio = non_uni_sampling(freq)    %Function declaration
%freq=3.7;
nu = 1: 1000;
for i_nu = 0 : 991
    for i = i_nu +3 :  i_nu +3+3
        if (rem(i,3)==0)
            nu(i) = i;
        else
            nu(i)=i + 0.05;
        end
    end
end
nu(1)=1.05;
nu(2)=2.05;
nu(3)=3;
nu(998)=998.05;
nu(1000) = 1000.05; 
xnu = cos(2*pi*(freq/1000)*nu); 		%nonuniform sampled signal 
%DFT
NFFT=1000;
Xnu = fft(xnu,NFFT); 			%compute DFT using FFT of noisy signal
nVals=0:2499; %DFT Sample points
%Find ratio of side lobe to main lobe
[pks,locs] = findpeaks(abs(Xnu(1:500)));
main_lobe = max(pks);  			%Value of main lobe
temp_sort = sort(pks,'descend');
side_lobe = temp_sort(2);
ratio = side_lobe/main_lobe; 
end

%
% Example of aliasing with
% 2 cos(2 pi 100 t + pi/3)
% and 2 cos(2 pi 600 t + pi/3)
%
% if these are sampled at 500 samples/sec,
% then the sampled versions are identical!
%
freq = 200; % example frequency
phase = pi/3; % example phase
mag = 2; % example magnitude
fs = 800; % sampling frequency
Ts = 1/fs; % sampling period
k = 1; % number of repetitions
num_points = 200; % How many points to use
% 200 makes it look smooth
num_samples = 11; % How many samples to simulate reading
% 11 puts "sampled" under "analog"
step = 2/(freq*num_points); % get a nice step size
t = 0:step:2*(1/freq); % "time"
n = 0:num_samples-1; % sample index
% x and y are simulated analog functions
x = mag*cos(2*pi*freq*t + phase);
y = mag*cos(2*pi*(freq+k*fs)*t + phase);
%disp(x); disp(y);
% x2 and y2 are simulated sampled version of x and y
x2(n+1) = mag*cos(2*pi*freq*n*Ts + phase);
y2(n+1) = mag*cos(2*pi*(freq+k*fs)*n*Ts + phase);
subplot(2,1,1);
plot(t, x,'r.-',t,y,'b-' );
my_title = sprintf ('Simulated analog signals, x(red) and y(blue) showing aliasing');
title(my_title);
xlabel('time ');
ylabel('Amplitude');
% Plot the "sampled" signals
subplot(2,1,2);
plot(n,x2,'rx', n,y2,'bo');
my_title = sprintf('Simulated digital signals, x(x) and y(o) showing aliasing' );
title(my_title);
xlabel('samples ');
ylabel('Amplitude');
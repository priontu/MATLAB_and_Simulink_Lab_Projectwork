Fs = 200000; %sampling frequency
t = 0:1/Fs:0.01;
f = 1000;
w = 2*pi*f;
sw = square(w*t, 50); %Generating Square Wave
%Implementing FFT:
F_nyq = Fs/2;
sw_fft = fft(sw);
sw_fft = 2*abs(sw_fft)/length(sw);
sw_fft = sw_fft(1:length(y)/2);
f = Fs*(0:(length(y)/2))/length(sw);
%Calculating Single-Sided Spectrum in dB:
SSSpec = abs(2*fft(sw)/length(sw));
SSSpec = db(SSSpec/sqrt(2));
SSSpec = SSSpec(1:length(sw)/2+1);
SSSpec(2:end-1) = 2*SSSpec(2:end-1);
%Plotting the Single Sided Spectrum:
plot(f, SSSpec, '-r');
xlabel('Frequency/Hz'); %labeling Axes
ylabel('Voltage/dB');
title("First Four Harmonics of Spectrum");
xlim([0,10000]);
grid on;
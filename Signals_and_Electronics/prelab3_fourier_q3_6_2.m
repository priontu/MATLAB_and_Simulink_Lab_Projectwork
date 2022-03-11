%%Square Wave(33% Duty Cycle) FFT Generation

%Square Wave Generation(33% Duty Cycle):
t = 0:0.00001:0.01;     %Setting up domain
f = 1000;
w = 2*pi*f;
sw = square(w*t, 33);
%Implementing FFT:
Fs = 200000;
F_nyq = Fs/2;
sw_fft = fft(sw);
sw_fft = 2*abs(sw_fft)/length(sw);
sw_fft = sw_fft(1:length(sw)/2);
freq = Fs*(0:(length(sw)/2))/length(sw);
%Generating Single-sided Spectrum in dB:
SSSpec = abs(2*fft(sw)/length(sw));
SSSpec = db(SSSpec);
SSSpec = SSSpec(1:length(sw)/2+1);
SSSpec(2:end-1) = 2*SSSpec(2:end-1);

%Plotting the square wave:
figure(1);
plot(t, sw);
title("Square Wave(33% Duty Cycle)");
xlabel('Time/s');
ylabel('Voltage/V');
ylim([-1.5, 1.5]);
xlim([0, 0.005]);
grid on;

%Plotting FFT Spectrum of Square wave:
figure(2);
freq_dom = linspace(0, F_nyq, length(sw)/2);
plot(freq_dom, sw_fft);
title("FFT Spectrum of Square Wave(33% Duty Cycle)");
xlabel('Frequency/Hz');
ylabel('Voltage/V');
grid on;

%Plotting Single-sided spectrum:
figure(3);
plot(freq, SSSpec);
title("Single-sided Spectrum");
xlabel('Frequency/Hz');
ylabel('Voltage/dB');
grid on;

%Plotting first 4 harmomics:
figure(4);
plot(freq, SSSpec);
title("First 4 Harmonics of Square Wave Spectrum");
xlabel('Frequency/Hz');
ylabel('Voltage/dB');
xlim([0 11000]);
grid on;
%%

%% The magnitude of the spectrum is seen to be increased when the pulse
%width 𝑇 was lowered. For 20% duty cycle, the magnitude spectrum was the highest and
%was the lowest for 50%. When the cycle duty was lowered, one part of the input signal
%came close together. This resulted into additional Fourier series coefficients. Thus,
%resulting into larger amplitude in the spectrum. 
%%
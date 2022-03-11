Fs = 200000;                     % sampling frequency
t = 0:1/Fs:0.01;                 %domain
sw = square(2*pi*1000*t, 50);     %square wave

%FFT:
L = length(sw);
F_nyq = Fs/2;                    %Nyquist frequency
sw_fft = fft(sw);                  %Applying FFT
sw_fft = 2*abs(sw_fft)/L;
sw_fft = sw_fft(1:length(sw)/2);
f = linspace(0, F_nyq, L/2);
%plot FFT
plot(f, sw_fft);
xlabel('Frequency/Hz');         %Labeling the axes
ylabel('f(t)');
title("FFT Spectrum of Square Wave"); 
grid on;
hold on;
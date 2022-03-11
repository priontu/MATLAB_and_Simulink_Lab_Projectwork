Fs = 100000;
%Generating Sine wave:
t = 0:1/Fs:0.01;
f = 2000;
w0 = 2*pi*f;
sw = sqrt(2)*sin(w0*t);

%Plotting sine wave:
figure(1);
plot(t, sw, '-r');
xlabel('Time/s');
ylabel('Voltage/V');
title('Sine Wave Plot');
ylim([-1.5, 1.5]);
xlim([0,0.002]);
grid on;

%Implementing FFT:
F_nyq = Fs/2;
L = length(sw);
sw_fft = fft(sw);
sw_fft = 2*abs(sw_fft/L);
db_sw_fft = db(sw_fft/sqrt(2)); %calculating dB of Vrms
db_sw_fft = db_sw_fft(1:L/2+1);


%plotting the spectrum:
figure(2);
freq_dom = linspace(0, F_nyq, L/2+1);
plot(freq_dom, db_sw_fft, '-r');
xlabel('Frequency/Hz');
ylabel('Voltage/dB');
title('FFT Spectrum');
xlim([0, 4000]);
ylim([-30, 1]);
grid on;
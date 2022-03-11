%%Question 1
%Signal properties:
m = 0.5;                    %modulation index
N = 25000;                  %number of samples

Fs = 100000;                %sampling frequency
Fc = 20000;                 %carrier signal frequency
Fm = 500;                   %modulating signal frequency

Ts = 1/Fs;                  %sampling period


%Setting up time and frequency domains:
t_dom = 0: Ts: ((N*Ts)-Ts);     %time domain built using Ts
f_dom = -Fs/2: Fs/N: Fs/2 - Fs/N;   %frequency domain build using Fs

%Radian frequencies:
w_c = 2*pi*Fc;              %carrier radian frequency
w_x = 2*pi*Fm;              %modulating radian frequency

%Generating carrier and modulating signal:
c = 5*sin(w_c*t_dom);       %carrier signal
x = sin(w_x*t_dom);         %modulation signal

%Generating modulated signal:
y = (1+m*x).*c;           %modulated signal

%Generating FFT of modulated signal:
Y = fft(y);                 %FFT Spectrum

%Plotting modulating and carrier signals:
figure(1)
subplot(2,1,1);
plot(t_dom, x);
title('Modulating signal in Time Domain');
xlabel('Time/s'); 
ylabel('Amplitude/V');
xlim([0,0.01]);
grid on;

subplot(2,1,2);
plot(t_dom, c);
title('Carrier signal in Time Domain');
xlim([0,0.01]);
ylabel('Amplitude/V');
xlabel('Time/s'); 
grid on;

%Plotting modulated signal:
figure(2)
plot(t_dom,y);
xlabel('Time/s'); 
ylabel('Amplitude/V');
title('Modulated signal in Time Domain');
xlim([0, 0.01]);
ylim([-8, 8]);
grid on;

%Plotting spectrum:
figure(3);
plot(f_dom, abs(fftshift(Y)));
ylabel('Amplitude/dB');
xlabel('Frequency/[rad/s]');
title('Modulated signal in Frequenct Domain');
grid on;


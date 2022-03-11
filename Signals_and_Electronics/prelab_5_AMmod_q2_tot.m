%% Question 1
%Signal properties:
m = 0.5;                    %modulation index
N = 25000;                  %number of samples

Fs = 300000;                %sampling frequency
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
plot(f_dom, fftshift(abs(Y)));
ylabel('Magnitude');
xlabel('Frequency/[rad/s]');
xlim([-30000, 30000]);
title('Modulated signal in Frequency Domain');
grid on;

%% Question 2
FFc = 1000; %filter cutoff frequency
FFs = 300000; %filter sampling frequency


%1st order filter implementation:
[b1, a1]=butter(1,(FFc/(FFs/2)),'low'); %butterworth 1st order filter formulation
[h, Ff_dom]=freqz(b1, a1, 1000, FFs); %h: frequency response, f: frequency vector
H_dB = 20.*log10(h.*conj(h)); %frequency response
figure(4);
semilogx(Ff_dom, H_dB, 'r');
title('Butterworth Low Pass Filter');
xlabel('Frequency');
ylabel('Magnitude');
xlim([100,100000]); %frequency range
grid on;
hold on;

%3rd order filter implementation:
[b3,a3]=butter(3,(FFc/(FFs/2)),'low'); %butterworth 3rd order
[h,Ff_dom]=freqz(b3,a3,1000,FFs);
H_dB = 20.*log10(h.*conj(h));

semilogx(Ff_dom, H_dB, 'g');
xlim([100,100000]); %range of frequency
xlabel('Frequency');
ylabel('Magnitude');

legend('1st Order Filter','3rd Order Filter');

%References:
%https://de.mathworks.com/help/signal/ref/butter.html
%https://de.mathworks.com/help/signal/ref/freqz.html
%https://de.mathworks.com/help/matlab/ref/semilogx.html

%% Question 3
figure(5);
rec_y = abs(y);
%Rectifying the wave and plotting it:
subplot(3,1,1);
plot(t_dom, rec_y);
title('Rectified AM Modulated Signal');
xlim([0,0.01]);
xlabel('Time/s'); 
ylabel('Amplitude/V');
grid on;

%Filtering and demodulating with 1st order filter:
y1 = filter(b1, a1, rec_y); 
subplot(3,1,2);
plot(t_dom, y1);
title('1st Order Filtered Demodulated Signal');
ylabel('Amplitude/V');
xlabel('Time/s'); 
xlim([0, 0.01]);
grid on;

%% Question 4
%Filtering and demodulating with 3rd order filter:
y3 = filter(b3, a3, rec_y);
subplot(3,1,3);
plot(t_dom, y3);
title('3rd Order Filtered Demodulated Signal');
xlabel('Time/s'); 
ylabel('Amplitude/V');
xlim([0,0.01]);
grid on;
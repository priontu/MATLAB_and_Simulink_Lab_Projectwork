fs = 100000;
fc = 20000; %carrier frequency
fm = 500; %modulation frequency
N = 25000; %number of samples
Ts = 1/fs; %sampling period
m = 0.5; %modulation index
t = 0: Ts: N*Ts-Ts;
s = 5*sin(2*pi*fc*t); %carrier signal
x = sin(2*pi*fm*t); %modulation signal
y = ((1+m*x).*s); %modulated signal
subplot(3,1,1);
plot(t,abs(y));
xlim([0,0.01]);
xlabel('Time/s'); 
ylabel('Amplitude/V');
title('Rectified AM modulated signal');
fc = 1000; %cutoff frequency
[b1,a1]=butter(1,(fc/(fs/2)),'low'); %butterworth 1st order
y1 = filter(b1,a1,abs(y));
subplot(3,1,2);
plot(t,y1);
xlim([0,0.01]);
title('Rectified AM Demodulated signal: First Order');
xlabel('Time/s'); 
ylabel('Amplitude/V');
[b2,a2]=butter(3,(fc/(fs/2)),'low'); %butterworth 3rd order
y2 = filter(b2,a2,abs(y));
subplot(3,1,3);
plot(t,y2);
xlim([0,0.01]);
title('Rectified AM Demodulated signal: Third Order');
xlabel('Time'); ylabel('Amplitude');

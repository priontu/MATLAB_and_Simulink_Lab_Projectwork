Fs=100*10^3; %sampling rate
fs=48;       %sampling rate
t=0:1/Fs:1;
fx = 50;
w0 = 2*pi*fx;
x= 5*sin(w0*t); %Input signal

subplot(3,1,1);
plot(t,x);      %generating input signal plot
title('Input Signal'); 
ylabel('X(t)/V');
grid on;
hold on;

wp = 2*pi*t*fs;
sw=(1+square(wp, 0.1))/2; %sampling signal
subplot(3,1,2);
plot(t,sw);               %plotting sampling signal
title('Unity Impulse Train'); 
ylabel('p(t)/V');
grid on
hold on;

subplot(3,1,3);
xp=x.*sw;           %output signal
plot(t,xp);         %plotting output signal
title('Output Signal'); 
ylabel('Xp(t)/V');
grid on;
hold on;
xlabel('Time/s');

xlim([0 1]);
ylim([-5 5]); 

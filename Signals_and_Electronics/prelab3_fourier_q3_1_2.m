Fs = 200000;            % sampling frequency
t = 0.00001:1/Fs:0.05;  %time domain
T = 10^(-3);            %period
f = 1/T;                % frequency of signal
w = 2*pi*f;             %calculating radian frequency
y = square(w*t, 50);    %developing square wave
plot (t, y);
xlim([0, 0.002]);       %x-axis boundary
ylim([-2, 2]);          %y-axis boundary
xlabel("Time/s");
ylabel("f(t)");
title("Square wave");
grid on;
hold on;
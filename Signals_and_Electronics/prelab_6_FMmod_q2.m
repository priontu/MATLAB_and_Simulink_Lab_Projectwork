%Setting up constants:
Bf = 2;
A_c = 2.5;

Fc = 40000; %Carrier signal frequency
Fm = 5000;  %Modulating signal frequency

Fs = 8*Fc;  %sampling frequency
Ts = 1/Fs;  %sampling period

N = 1000;   %number of samples

%Generating time domain:
t = 0 : Ts : (N*Ts)-Ts;   %time domain

%Calculating radian frequencies:
w_c = 2*pi*Fc;          %radian carrier frequency
w_m = 2*pi*Fm;          %radian modulating frequency

y_m = A_c.*cos(w_c.*t + Bf.*sin(w_m.*t)); %output signal

L = length(y_m);

%Generating spectrum output:
Spec = fft(y_m,L);
Spec = Spec(1:L/2);
absY = abs(Spec);

%Displaying magnitudes in dBrms:
dBrms = mag2db(absY/L);

f = (0:(L/2)-1)*Fs/L;

BT = 2*Fm*(Bf+1); %Applying Carson Rule
fprintf("B(%f) = %d\n", Bf, BT);

%Plotting the spectrum:
plot(f, dBrms);
ylim([-40, 10]);
xlim([10000, 70000]);
title("FM Modulated Signal in Frequency Domain");
ylabel("A(dBrms)");
xlabel("f/[Hz]");
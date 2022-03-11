A_c = 2.5;
Fc = 40000;
Fm = 5000;
Bf = 0.2; %change this value to 1 and 2

Fs = 4*Fc;
Ts = 1/Fs;

N = 1000;

t = 0 : Ts : N*Ts-Ts;
f = -Fs/2 : Fs/N : Fs/2 - Fs/2;

s = A_c.*cos(2*pi.*Fc.*t+Bf.*sin(2*pi.*Fm.*t));

L = length(s);

S = fft(s,L);
S = S(1:L/2);
dBVrms = mag2db(2*abs(S)/L);

f = (0:L/2-1)*Fs/L;

B = 2*Fm*(Bf+1);
plot(f, dBVrms);

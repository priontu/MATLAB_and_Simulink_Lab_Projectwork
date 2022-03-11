F_c = 40000; 
Ac = 2.5;
F_m = 5000;
t_min = 30*10^-3; % minimal signal length
d = [1000, 5000, 10000];
B = d / 5000;

F_s = F_c * 8; % Sampling frequency
F_nyq = F_s/2; % Nyquist frequency


Ts = 1/F_s * (2^nextpow2(t_min * F_s));

t_dom = 0: 1/F_s : Ts - 1/F_s;

for i = 1:length(B)
w_c = 2*pi*F_c ;
w_m = 2*pi*F_m;
A_fm = Ac*cos(w_c*t_dom + B(i)*sin(w_m*t_dom));
L_t = length(t_dom);
FFT_fm = 2*abs(fft(A_fm))/L_t;
FFT_fm = FFT_fm(1:end/2);
f_dom_fm = linspace(0, F_nyq, length(FFT_fm));
figure(i);
log_fm = 20 * log10 (FFT_fm/sqrt(2));
plot (f_dom_fm, log_fm, 'LineWidth', 2);
xlabel('f/Hz'); ylabel('A/dBrms');
ylim ([-40 10]);
xlim ([10^3 70*10^3]); 
grid on;
end
%% Initialization
R = 390;
C = 270*10^-9;
L = 10*10^-3;
V = 5;
s = tf('s');
Z_C = 1/(s*C);
Z_L = s*L;
Z_R = R;
Z_tot = Z_C + Z_L + Z_R;

%% Plot across Resistor
H_R = Z_R/Z_tot;
bode(H_R, 'r');
grid on;
hold on;

H_ref = (10^(-3/20))*s/s;
bode(H_ref, 'b');
grid on;
hold on;

H_cut = 1*s/s;
bode(H_cut, 'g');
grid on;
hold on;


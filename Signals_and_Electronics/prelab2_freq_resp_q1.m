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
%% Bode plots
%Ratio across Capacitor
H_C = Z_C/Z_tot;
bode(H_C, 'b');
grid on;
hold on;

%Ratio across Resistor
H_R = Z_R/Z_tot;
bode(H_R, 'r');
grid on;
hold on;

%Ratio across Inductor
H_L = Z_L/Z_tot;
bode(H_L, 'g');
grid on;
hold on;

%Ratio across capacitor and Inductor
H_LC = (Z_C + Z_L)/Z_tot;
bode(H_LC, 'm');
grid on;
hold on;

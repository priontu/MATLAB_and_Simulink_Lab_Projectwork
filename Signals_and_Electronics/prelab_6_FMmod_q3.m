R = 100;
C = 10^-7;
L = 10^-2;


s = tf('s');

Z_R = R;
Z_C = 1/(s*C);
Z_L = s*L;

Z_out = ((1/Z_L)+(1/Z_C)+(1/Z_C)+(1/Z_R))^-1;

H = Z_out/(Z_out + Z_R);
bode(H);


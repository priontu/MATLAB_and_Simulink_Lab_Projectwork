a = 7500;
w_d = 258089.94;
C_1 = -1;
C_2 = -0.029;

t = 0:0.0000001:0.01;
v_c = 1 + exp((-1*a).*t).*(C_1.*cos(w_d.*t))+ (C_2.*sin(w_d.*t));
plot(t, v_c);
ylim([0 2]);
xlim([0 10^-4]);
xlabel('t/s');
ylabel('V_c (t)/V');

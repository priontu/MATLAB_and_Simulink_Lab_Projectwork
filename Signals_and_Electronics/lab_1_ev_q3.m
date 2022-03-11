a = 258198.89;
C_1 = -1;
C_2 = -a;

t = 0:0.0000001:0.01;
v_c = 1 + exp((-1*a).*t).*(C_1 + C_2.*t);
plot(t, v_c);
ylim([0 2]);
xlim([0 10^-4]);
xlabel('t/s');
ylabel('V_c (t)/V');
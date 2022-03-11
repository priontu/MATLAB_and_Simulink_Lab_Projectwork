function [out, state_out] = PLL(in, N, s)
out = zeros(size(in));
for i = 1:N;
 %We are computing phase difference
 z = in(i)*s.out_old;
 v = s.a1*s.v_old + s.b0*z + s.b1*s.z_old;
 s.accum = s.accum + s.f-(s.k/(2*pi))*v;
 s.accum = s.accum - floor(s.accum);
 %Use sine table to calculate output
 out(i) = s.sine_table(floor(1024*s.accum)+1);
 %update state variables
 s.out_old = out(i);
 s.z_old = z;
 s.v_old = v;
end
state_out=s;

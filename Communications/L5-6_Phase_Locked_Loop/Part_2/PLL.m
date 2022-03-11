
function [out,state_out] = PLL(in, N, state_in)
out = zeros(size(in));
s = state_in;
%unit amplitude
amp=0;
for sample_idx=1:N
 amp=amp+abs(in(sample_idx));
end
amp_est=amp/N/(2/pi);
for i=1:N
 scale(i)=in(i)/amp_est;
%Compute phase difference
 z=scale(i)*s.out_old;
 v=s.a1*s.v_old+s.b0*z + s.b1*s.z_old;
 s.accum=s.accum+s.f-(s.k/(2*pi))*v;
 s.accum=s.accum-floor(s.accum);
%sine table and calculate output
 out(i)=s.sine_table(floor(1024*s.accum)+1);
%update state variable
 s.out_old=out(i);
 s.z_old=z;
 s.v_old=v;
end
state_out=s;

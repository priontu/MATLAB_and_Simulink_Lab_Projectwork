function [state_out, y] = fir(state_in, x)
% [state_out, y] = fir(state_in, x);
%
% Executes the FIR block.
%
% Inputs:
% state_in Input state
% x Samples to process
% Outputs:

% state_out Output state
% y Processed samples
% Get state
s = state_in;
% Move samples into tail of buffer
% Filter samples and move into output
% Return updated state
for ii=0:s.Ns - 1
 % Store a sample
 s.buff(s.n_t+1) = x(ii+1);
 % Increment head index (circular)
 s.n_t = bitand(s.n_t+1, s.Mmask);
  s.ptr = bitand(s.n_t+s.Mmask, s.Mmask);

 sum = 0;
 for g = 0:size(s.h)-1
    sum = sum + s.buff(s.ptr + 1) * s.h(g+1);
      s.ptr = bitand(s.ptr+s.Mmask, s.Mmask);
 end
 y(ii + 1) = sum;
end
state_out = s;

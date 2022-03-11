% test_fir1.m
%
% Script to test the FIR filter.
% Global parameters
Nb = 100; % Number of buffers
Ns = 100; % Samples in each buffer
% Generate filter coefficients
p.beta = 0.5;
p.fs = 0.1;
p.root = 0; % 0=rc 1=root rc
M = 64;


Nd = 10; % Delay of block

[h f H Hi] = win_method('rc_filt', p, 0.2, 1, M, 0);
% Generate some random samples.
x = randn(Ns*Nb, 1);
% Type of simulation
stype = 0; % Do simple convolution
%stype = 1; % DSP-like filter
if stype==0
 y = conv(x, h);
elseif stype==1
 % Simulate realistic DSP filter
 % ADD YOUR CODE HERE !!!
 
    state_fir = fir_init(h, Ns);
 
    % Generate some random samples.
    x = randn(Ns*Nb, 1);
    % Reshape into buffers
    xb = reshape(x, Ns, Nb);
    % Output samples
    yb = zeros(Ns, Nb); 

    for bi=1:Nb
     [state_fir, yb(:,bi)] = fir(state_fir, xb(:,bi));
    end
    % Convert individual buffers back into a contiguous signal.
    y = reshape(yb, Ns*Nb, 1);

else
 error('Invalid simulation type.');
end
% Compute approximate transfer function using PSD
Npsd = 200; % Blocksize (# of freq) for PSD
[Y1, f1] = periodogram(y, [], Npsd,1);
[X1, f1] = periodogram(x, [], Npsd,1);


figure(1);
plot(f1, abs(sqrt(Y1./X1)), f, abs(H));
hold on;
grid on;
%plot(f, abs(H), 'b');
xlim([0 0.2]);
%ylim([0, 20]);
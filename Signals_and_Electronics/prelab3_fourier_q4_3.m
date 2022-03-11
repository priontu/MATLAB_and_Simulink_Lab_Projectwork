[AudioInput,Fs] = audioread("sound_sample.wav");
L = numel(AudioInput);
t = 0:1/Fs:(L-1)/Fs;
Spec = fft(AudioInput)/L;
Spec2 = abs(Spec(1:floor((L+1)/2)));
Dom = (0:(L-1)/2);
fDom = Fs*Dom/L;
plot(fDom, Spec2);
xlim([0,4000]);
xlabel("Frequency");
ylabel("Amplitude");
grid on;
%The tones forming this signal are at the points at which half of the FFT spectrum exists. The
%tone forming the signal is a multitone at frequencies 500 Hz, 1000 Hz, 2000 Hz, and 3600
%Hz. 
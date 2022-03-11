FFc = 1000; %filter cutoff frequency
FFs = 300000; %filter sampling frequency

[b,a]=butter(1,(FFc/(FFs/2)),'low'); %butterworth 1st order filter formulation
[h,Ff_dom]=freqz(b,a,1000,FFs); %h: frequency response, f: frequency vector

%1st order filter implementation:
H_dB = 20.*log10(h.*conj(h)); %frequency response
figure(1);
semilogx(Ff_dom, H_dB, 'r');
xlim([100,100000]); %frequency range
title('Butterworth Low Pass Filter');
xlabel('Frequency');
ylabel('Magnitude');

grid on;
hold on;
%3rd order filter implementation:
[b,a]=butter(3,(FFc/(FFs/2)),'low'); %butterworth 3rd order
[h,Ff_dom]=freqz(b,a,1000,FFs);
H_dB = 20.*log10(h.*conj(h));

semilogx(Ff_dom, H_dB, 'g');
xlim([100,100000]); %range of frequency
title('Butterworth 3rd Order Low Pass Filter');
xlabel('Frequency');
ylabel('Magnitude');

legend('1st Order Filter','3rd Order Filter');

%References:
%https://de.mathworks.com/help/signal/ref/butter.html
%https://de.mathworks.com/help/signal/ref/freqz.html
%https://de.mathworks.com/help/matlab/ref/semilogx.html
Fs=100*10^3;
fp=1000;  %sampling pulse frequency
t=0:1/Fs:0.1;   %time domain
w0 = 2*pi*50;   %freqency of x(t)
x= 5*sin(w0*t); %generating input signal
subplot(3,1,1);
plot(t,x,'b');  %plotting input signal
title('Input Signal'); ylabel('x(t)/V');
grid on;
hold on;
rec=[0.1, 50];
for train = 1: length(rec)
  for   rate = 1: length(fp)

    p = max(square(2*pi*fp*rate*t,rec(train)),0); %generating sampling pulse
    subplot(3,1,2);
    plot(t,p,'b');  %plotting sampling pulse
    title('Rectangular Pulse'); 
    ylabel('p(t)/V');
    grid on
    hold on;

    subplot(3,1,3);
    xp=x.*p;    %generating output signal
    plot(t,xp,'b'); %plotting output signal
    title('Output Signal'); 
    ylabel('Xp(t)/V');
    grid on;
    hold on;
    xlabel('Time/s');

    xlim([0, 0.1]);
    ylim([-5, 5]);
  end
end

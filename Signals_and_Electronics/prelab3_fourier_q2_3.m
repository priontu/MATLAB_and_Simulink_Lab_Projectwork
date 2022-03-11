T = 2*pi;                   %period of function
t = (-T/2:0.0001:T/2);      %setting up time domain
y = 2*t/T; 
f = 0;
for n=1:5                   %developing the fourier series
 f = f + ((-2*(-1)^n/(n*pi)))*sin(n*2*pi/T*t);
end
figure(2);
plot(t,y);                   %plotting the line
grid on;
hold on;
plot(t,f);                   %plotting the fourier series
xlim([-pi,pi]);              %boundary of plot
xlabel("Time /s");           %labeling the axis
ylabel("f(t)");
grid on;
hold on;
T = 2*pi;                   %period of function
t = (-T/2:0.0001:T/2);      %setting up time domain
y = 2*t/T;                %setting up function y
figure(1);                  %setting up figure
plot(t,y);                  %plotting the function
xlim([-pi,pi]);             %setting up plot limits
grid on;
xlabel("Time /s");          %labeling the axis
ylabel("f(t)");
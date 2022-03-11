clear; clc; close all

filename = 'E:\electronics_lab\Draft3.txt';

y_arr = dlmread(filename, '\t', 1, 0);

t = y_arr(1:end, 1);
v1 = y_arr(1:end, 2);
v2 = y_arr(1:end, 3);
i = y_arr(1:end, 4);

plot(t, v1);
hold on;
grid on;

plot(t, v2);
hold on;
grid on;

plot(t, i);
hold on;
grid on;





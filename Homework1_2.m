%% *Homework1_2*

%% Programmers

% Mohammad Mahdi Elyasi - 9823007
% Moein Nasiri - 9823093

%% Clear the Workspace
Clear all;
close all;
clc;

%% Homework1_6_1
fs = 50000;
t = 0:1 / fs:0.004;
f1 = 1000;
f2 = 4000;
f3 = 6000;
x_original = cos(2 * pi * f1 * t) + cos(2 * pi * f2 * t) + cos(2 * pi * f3 * t);

fs_low = 5000;
t_sampled = 0:1 / fs_low:0.004;
x_sampled = cos(2 * pi * f1 * t_sampled) + cos(2 * pi * f2 * t_sampled) + cos(2 * pi * f3 * t_sampled);

figure('Name', 'Aliasing in the time domain');
plot(t, x_original, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original signal');
grid on;
hold on;
plot(t_sampled, x_sampled, 'o', 'LineWidth', 2);
legend('Original signal', 'Sampled signal');

%% Homework1_6_2

fs_low = 5000;
prc_rate = 100;
t1 = -0.004:1 / (prc_rate * fs_low):0.004;
x1 = zeros(1, (length(t1) + 1) / 2);
x1(1:prc_rate:end) = x_sampled;

h = sinc(fs_low, t1);
y = conv(x1, h, 'same');

plot(t1((length(t1) + 1) / 2:end), y, 'LineWidth', 1.5);

legend('Original signal', 'Sampled signal', 'Reconstructed signal')

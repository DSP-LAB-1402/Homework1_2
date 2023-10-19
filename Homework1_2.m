%% *Homework1_2*

%% Programmers

% Mohammad Mahdi Elyasi - 9823007
% Moein Nasiri - 9823093

%% Clear the Workspace
Clear all;
close all;
clc;

%% Homework1_6
% In this task we want to show what would be sampled signal and
% how different it is with original signal
%
% Declaring variables
fs = 50000;
t = 0:1 / fs:0.004;
f1 = 1000;
f2 = 4000;
f3 = 6000;
fs_low = 5000;
t_sampled = 0:1 / fs_low:0.004;
%%%
% Now we declare signals need to be plootted
x_original = cos(2 * pi * f1 * t) + cos(2 * pi * f2 * t) + cos(2 * pi * f3 * t);
x_sampled = cos(2 * pi * f1 * t_sampled) + cos(2 * pi * f2 * t_sampled) + cos(2 * pi * f3 * t_sampled);
%%%
% Now we plot signals for the first part
figure('Name', 'Aliasing in the time domain');
plot(t, x_original, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Signals');
grid on;
hold on;
plot(t_sampled, x_sampled, 'o', 'LineWidth', 2);
legend('Original signal', 'Sampled signal');
%%%
% part 2
% Here we want to reconstruct original signals, with a specific frequency
% Now we declare variables for second part of this task

prc_rate = 100;
t1 = -0.004:1 / (prc_rate * fs_low):0.004;
x1 = zeros(1, (length(t1) + 1) / 2);
x1(1:prc_rate:end) = x_sampled;
%%%
% Here we declare signals need to be plotted
h = sinc(fs_low * t1);
y = conv(x1, h, 'same');
%%%
% Now we plot original signal, Sampled signal and reconstructed signal
figure('Name', 'Aliasing in the time domain');
plot(t, x_original, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Signals');
grid on;
hold on;
plot(t_sampled, x_sampled, 'o', 'LineWidth', 2);
hold on;
plot(t1((length(t1) + 1) / 2:end), y, 'LineWidth', 1.5);
legend('Original signal', 'Sampled signal', 'Reconstructed signal')
%%%
% Based on sampled frequency we would know that frequencies which doesn't satisfy nyquist law
% can't be plotted. so only cosine with 1k hertz frquency can be plotted

% if we don't have ideal filter, then the reconstructed signal can't be the same as original signal

%% Homework1_7
% Here in this task we want to show if we sample signals, what would happen
% to their frquency spectrum
% Now we declare variables needed for plot
t = -5:0.01:5;
f1 = 4;
f2 = 5;
f3 = 10;
f4 = 20;
t_1 = -5:1 / f1:5;
t_2 = -5:1 / f2:5;
t_3 = -5:1 / f3:5;
t_4 = -5:1 / f4:5;
%%%
% Now we declare signals needed for plot
x_t = (sinc (5 * t)) .^ 2;
x_t1 = (sinc (5 * t_1)) .^ 2;
x_t2 = (sinc (5 * t_2)) .^ 2;
x_t3 = (sinc (5 * t_3)) .^ 2;
x_t4 = (sinc (5 * t_4)) .^ 2;

figure('Name', 'Fft of signals');
subplot(2, 1, 1)
plot(t, abs(fftshift(fft(x_t))), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Fft of oiginal signal');
grid on;

subplot(2, 1, 2)
plot(t_1, abs(fftshift(fft(x_t1))), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Fft of sampled signal1');
grid on;

figure('Name', 'Fft of signals');
subplot(2, 1, 1)
plot(t, abs(fftshift(fft(x_t))), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Fft of original signal');
grid on;

subplot(2, 1, 2)
plot(t_2, abs(fftshift(fft(x_t2))), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Fft of sampled signal2');
grid on;

figure('Name', 'Fft of signals');
subplot(2, 1, 1)
plot(t, abs(fftshift(fft(x_t))), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Fft of original signal');
grid on;

subplot(2, 1, 2)
plot(t_3, abs(fftshift(fft(x_t3))), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Fft of sampled signal3');
grid on;

figure('Name', 'Fft of signals');
subplot(2, 1, 1)
plot(t, abs(fftshift(fft(x_t))), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Fft of original signal');
grid on;

subplot(2, 1, 2)
plot(t_4, abs(fftshift(fft(x_t4))), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Fft of sampled signal4');
grid on;
%%%
% Based on what we saw, Signal3 and Signal4 had no problem in terms of aliasing
% of course based on Nyquist law, signal3 which had 2B=fs may have problems if we had sinusodial signals.
% So we prefer to have 2B > fs.
% For signal2 since Nyquist law isn't satisfied we have aliasing , and it makes sinc to be
% integer. and we know it is 0 if sinc becomes inteer (except in 0). so we see a DC signal.
% For signal1 Nyquist law isn't satisfied so we see sum of DC and tip of the signal.
% In conclusion, if we don't satisfy Nyquist law, then we see aliasing if frequency spectrum.
%% Homework1_8

N = 256;
t = -5:1 / N:5;
t1 = -5:1 / (2 * N):5;
t2 = -5:3 / (2 * N):5;
t3 = -5:3 / N:5;

xt = sinc(2 * t);
xt1 = sinc(2 * t1);
xt2 = sinc(2 * t2);
xt3 = sinc(2 * t3);
figure('Name', 'Original Signal');
subplot(2, 1, 1)
plot(t, xt, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original signal');
grid on;

subplot(2, 1, 2)
plot(t, abs(fftshift(fft(xt))), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('sampled signal');
grid on;

figure('Name', 'Original Signal');
subplot(2, 1, 1)
plot(t1, xt1, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original signal');
grid on;

subplot(2, 1, 2)
plot(t1, abs(fftshift(fft(xt1))), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('sampled signal');
grid on;

figure('Name', 'Original Signal');
subplot(2, 1, 1)
plot(t2, xt2, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original signal');
grid on;

subplot(2, 1, 2)
plot(t2, abs(fftshift(fft(xt2))), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('sampled signal');
grid on;

figure('Name', 'Original Signal');
subplot(2, 1, 1)
plot(t3, xt3, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original signal');
grid on;

subplot(2, 1, 2)
plot(t3, abs(fftshift(fft(xt3))), 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Amplitude');
title('sampled signal');
grid on;

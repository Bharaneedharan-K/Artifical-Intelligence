clc;
clear;
close all;

%% --- Define Input Signal (x[n]) and Filter (h[n]) ---
% Example: x[n] = input audio pulse; h[n] = filter (e.g., moving average)

x = [1 2 1];               % Input signal
h = [1 -1 2];         % Simple averaging filter (FIR filter)

n_x = 0:length(x)-1;               % Time index for x[n]
n_h = 0:length(h)-1;               % Time index for h[n]

%% --- Perform Linear Convolution ---
y = conv(x, h);                    % Output signal after filtering
n_y = 0:length(y)-1;               % Time index for y[n]

%% --- Plotting ---
figure;

% Plot 1: Input Signal x[n]
subplot(3,1,1);
stem(n_x, x, 'filled');
title('Input Signal x[n]');
xlabel('n');
ylabel('Amplitude');
grid on;

% Plot 2: Filter h[n]
subplot(3,1,2);
stem(n_h, h, 'filled');
title('Filter Impulse Response h[n]');
xlabel('n');
ylabel('Amplitude');
grid on;

% Plot 3: Output Signal y[n] = x[n] * h[n]
subplot(3,1,3);
stem(n_y, y, 'filled');
title('Output Signal y[n] = x[n] * h[n] (Linear Convolution)');
xlabel('n');
ylabel('Amplitude');
grid on;

%% --- Application Notes ---
disp('--- Linear Convolution & Digital Filtering ---');
disp('1. Convolution simulates how an input signal is modified by a filter.');
disp('2. Used in audio processing for effects like echo, reverb, noise reduction.');
disp('3. Used in image processing for blurring, sharpening, edge detection.');

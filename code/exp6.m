clc;
clear;
close all;

% --- Define signals x(n) and y(n) ---
x = [1 2 3 4 3 2 1];                % Original signal
y = [0 0 1 2 3 4 3 2 1 0 0];       % Delayed version of x (echo)

n_x = 0:length(x)-1;               % Time index for x(n)
n_y = 0:length(y)-1;               % Time index for y(n)

% --- Cross-Correlation between x and y ---
[crossCorr, lagsCross] = xcorr(y, x);  

% --- Autocorrelation of x ---
[autoCorr, lagsAuto] = xcorr(x);       

% --- Plotting ---

figure;

% Plot 1: Original Sequence x(n)
subplot(3,2,1);
stem(n_x, x, 'filled');
title('Original Sequence x(n)');
xlabel('n');
ylabel('Amplitude');
grid on;

% Plot 2: Second Sequence y(n)
subplot(3,2,2);
stem(n_y, y, 'filled');
title('Modified Sequence y(n)');
xlabel('n');
ylabel('Amplitude');
grid on;

% Plot 3: Cross-Correlation
subplot(3,2,[3 4]);
stem(lagsCross, crossCorr, 'filled');
title('Cross-Correlation between y(n) and x(n)');
xlabel('Lag');
ylabel('Amplitude');
grid on;

% Plot 4: Autocorrelation
subplot(3,2,[5 6]);
stem(lagsAuto, autoCorr, 'filled');
title('Autocorrelation of x(n)');
xlabel('Lag');
ylabel('Amplitude');
grid on;

% --- Notes ---
disp('--- Signal Analysis Applications ---');
disp('1. Echo Detection: The peak in cross-correlation indicates the echo delay.');
disp('2. Signal Alignment: Cross-correlation helps align two similar signals.');
disp('3. Feature Detection: Autocorrelation identifies repeating patterns in signals.');
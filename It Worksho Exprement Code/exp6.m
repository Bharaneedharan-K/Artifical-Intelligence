clc; clear; close all;

%% 1. Define two sequences x(n) and y(n)
x = [1, 2, 3, 4, 5];    % Example sequence x(n)
y = [5, 4, 3, 2, 1];    % Example sequence y(n)

%% 2. Compute Cross-Correlation of x(n) and y(n)
cross_corr = xcorr(x, y);  % Cross-correlation of x and y

%% 3. Compute Autocorrelation of x(n)
auto_corr = xcorr(x, x);  % Autocorrelation of x

%% 4. Visualize Results
figure;

% Plot Cross-Correlation
subplot(2,1,1);
stem(-length(x)+1:length(x)-1, cross_corr, 'filled');
title('Cross-Correlation of x(n) and y(n)');
xlabel('Lag (n)'); ylabel('Correlation'); grid on;

% Plot Autocorrelation
subplot(2,1,2);
stem(-length(x)+1:length(x)-1, auto_corr, 'filled');
title('Autocorrelation of x(n)');
xlabel('Lag (n)'); ylabel('Correlation'); grid on;

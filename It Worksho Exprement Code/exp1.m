% Square Wave using Fourier Series
clc;
clear;

% Parameters
T = 2*pi;         % Time period
t = linspace(0, T, 1000); % Time vector
N = 10;           % Number of terms in the Fourier series
square_wave = zeros(size(t)); % Initialize square wave

% Fourier series summation (odd harmonics only)
for k = 1:2:2*N-1
    square_wave = square_wave + (1/k)*sin(k*t);
end

% Multiply by constant
square_wave = (4/pi)*square_wave;

% Plot the result
plot(t, square_wave, 'LineWidth', 2);
xlabel('Time');
ylabel('Amplitude');
title(['Square Wave using Fourier Series (N = ', num2str(N), ')']);
grid on;

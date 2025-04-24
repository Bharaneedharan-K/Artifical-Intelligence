clc;
clear;
close all;

% Parameters
Fs = 44100;       % Sampling frequency (Hz)
f0 = 440;         % Fundamental frequency (Hz)
T = 1;            % Duration (seconds)
N = 10;          % Number of harmonics

% Time vector
t = 0:1/Fs:T;

% Square wave synthesis using Fourier series
x = zeros(size(t));
for k = 1:2:N
    x = x + (1/k) * sin(2 * pi * k * f0 * t);
end
x = (4/pi) * x; % Normalize amplitude

% Plot the waveform
figure;
plot(t, x, 'b');
xlabel('Time (s)');
ylabel('Amplitude');
title(['Fourier Series Approximation of Square Wave (', num2str(N), ' Harmonics)']);
grid on;
xlim([0, 3/f0]); % Show three periods

% Play the sound
sound(x, Fs);

% Frequency domain analysis
X = abs(fft(x));
f = linspace(0, Fs, length(X));

% Plot the spectrum
figure;
plot(f(1:length(X)/2), X(1:length(X)/2));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum of Synthesized Square Wave');
grid on;
clc; clear; close all;

%% 1. Load an example audio signal
[x, fs] = audioread('sample-3s.wav'); % Built-in sample in MATLAB
x = x(:,1);                         % Use mono channel
x = x(1:1024);                      % Take first 1024 samples

%% 2. Fourier Transform (FFT)
X = fft(x);
N = length(x);
f = (0:N-1)*(fs/N);                 % Frequency axis

% Plot FFT magnitude
figure;
subplot(3,1,1);
plot(f, abs(X));
title('Fourier Transform');
xlabel('Frequency (Hz)'); ylabel('|X(f)|'); grid on;

%% 3. Z-Transform (Pole-Zero Plot)
% Use filter representation: numerator = signal, denominator = 1
zplane(x, 1); 
title('Pole-Zero Plot of Audio Signal');

%% 4. Plot time-domain signal
subplot(3,1,3);
plot((0:N-1)/fs, x);
title('Time-Domain Audio Signal');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

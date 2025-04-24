clc; clear; close all;

%% 1. Simulated ECG Signal (Predefined)
fs = 250;                     % Sampling rate (Hz)
t = 0:1/fs:10;                % 10 seconds duration
% Simulated ECG-like waveform: combination of sinusoids + noise
ec_signal = 1.5*sin(2*pi*1.2*t) + 0.5*sin(2*pi*3*t); 
ec_signal = ec_signal + 0.1*randn(size(t));         % Add slight noise

%% 2. Fourier Transform Analysis
N = length(ec_signal);
f = (0:N-1) * (fs/N);         % Frequency vector
ecq_fft = abs(fft(ec_signal)); % FFT magnitude

%% 3. Z-Transform Demo (Symbolic for theory, not on long numeric signals)
disp('--- Z-Transform Educational Demo ---');
syms z n;
x = (1/2)^n * heaviside(n);   % Simple symbolic sequence
Xz = ztrans(x, z, n);         % Z-transform
disp('Z-transform of (1/2)^n:');
pretty(Xz);

%% 4. Heart Rate Variability (HRV) Analysis
% Peak detection simulates R-peaks in ECG
[pks, locs] = findpeaks(ec_signal, 'MinPeakHeight', 1, 'MinPeakDistance', 0.6*fs);
RR_intervals = diff(locs) / fs;     % RR intervals in seconds
HRV = std(RR_intervals);            % Standard deviation of RR intervals

%% 5. Visualization
figure('Name','ECG Signal Analysis','NumberTitle','off');

subplot(3,1,1);
plot(t, ec_signal); 
title('Simulated ECG Signal');
xlabel('Time (s)'); ylabel('Amplitude'); grid on;

subplot(3,1,2);
plot(f(1:round(N/2)), ecq_fft(1:round(N/2)));
title('FFT of ECG Signal');
xlabel('Frequency (Hz)'); ylabel('Magnitude'); grid on;

subplot(3,1,3);
stem(RR_intervals, 'filled'); 
title('RR Intervals');
xlabel('Interval #'); ylabel('Time (s)'); grid on;

%% 6. Display HRV
disp(['Estimated Heart Rate Variability (HRV): ', num2str(HRV), ' sec']);

%% 7. Save HRV Data
save('HRV_results.mat', 'RR_intervals', 'HRV');

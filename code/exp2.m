clc; clear; close all;
%% 1. Load ECG Image File Directly
ec_image = imread('ecg_image.jpg');
%% 2. Convert to Grayscale and Process Image
gray_img = rgb2gray(ec_image); % Convert to grayscale
bw_img = imbinarize(gray_img, 'adaptive'); % Adaptive binarization
edges = edge(bw_img, 'Sobel'); % Detect ECG waveform edges
%% 3. Extract ECG Waveform (Pixel to Signal Conversion)
[row, col] = find(edges); % Get waveform points
[sorted_col, sort_idx] = sort(col); % Sort x-coordinates
sorted_row = row(sort_idx); % Get corresponding y-coordinates
% Normalize and invert extracted waveform
ec_signal = -rescale(sorted_row, -1, 1);
fs = 250; % Estimated sampling rate (adjust if needed)
t = (0:length(ec_signal)-1) / fs;
%% 4. Fourier Transform Analysis
N = length(ec_signal);
f = (0:N-1) * (fs/N);
ecq_fft = abs(fft(ec_signal)); % Compute FFT
%% 5. Z-Transform Analysis
syms z;
ecq_z = ztrans(ec_signal, z);
%% 6. Heart Rate Variability (HRV) Analysis
[pks, locs] = findpeaks(ec_signal, 'MinPeakHeight', 0.5, 'MinPeakDistance', 0.6 * fs);
RR_intervals = diff(locs) / fs; % Convert to seconds
HRV = std(RR_intervals); % Compute HRV as standard deviation of RR intervals
%% 7. Visualization & Results
figure;
subplot(3,1,1);
imshow(ec_image);
title('Selected ECG Image');
subplot(3,1,2);
plot(t, ec_signal);
title('Extracted ECG Signal');
xlabel('Time (s)'); ylabel('Amplitude');
tf = round(N/2); % Adjusted index range for FFT visualization
subplot(3,1,3);
plot(f(1:tf), ecq_fft(1:tf));
title('FFT of Extracted ECG');
xlabel('Frequency (Hz)'); ylabel('Magnitude');
% Display HRV result
disp(['Estimated Heart Rate Variability (HRV): ', num2str(HRV), ' sec']);
%% Save HRV Data
save('HRV_results.mat', 'RR_intervals', 'HRV');
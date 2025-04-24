%% 
% MATLAB Program to compute and visualize Fourier and Z-transforms of a sampled audio signal
clear;
clc;
% Step 1: Load the audio file (Use your own audio file path here)
[audio_signal, fs] = audioread('exp5.wav'); % Load the audio signal (e.g., .wav file)
audio_signal = audio_signal(:,1); % Use only one channel if stereo (you can also analyze stereo if needed)
% Step 2: Compute and visualize the Fourier Transform (Frequency content)
N = length(audio_signal);        % Length of the audio signal
t = (0:N-1) / fs;                % Time vector for the signal
f = fs * (0:(N/2)) / N;          % Frequency vector for positive frequencies
% Compute the Fourier Transform (FFT)
audio_fft = fft(audio_signal);
% Compute the magnitude and phase of the FFT
audio_fft_mag = abs(audio_fft) / N;
audio_fft_mag = audio_fft_mag(1:N/2+1);  % Only plot the positive frequencies
audio_fft_phase = angle(audio_fft(1:N/2+1));
% Plot the Fourier Transform (Magnitude and Phase)
figure;
subplot(2,1,1);
plot(f, 20*log10(audio_fft_mag));   % Magnitude in dB
title('Magnitude Spectrum (Fourier Transform)');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;
subplot(2,1,2);
plot(f, audio_fft_phase);           % Phase spectrum
title('Phase Spectrum (Fourier Transform)');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;
% Step 3: Compute and visualize the Z-Transform
% Use the Discrete-Time Fourier Transform (DTFT) approximation for Z-transform
z = exp(1j * 2 * pi * (0:N-1) / N);  % The Z-transform variable (on the unit circle)
z_transform = fft(audio_signal);  % Use FFT as an approximation of the Z-transform
% Plot the pole-zero plot of the Z-transform
figure;
zplane(z_transform, ones(N,1));  % Plot the pole-zero plot (unit circle)
title('Pole-Zero Plot of the Z-Transform');
% Step 4: Analyze the relationship of the pole-zero plot to frequency and stability
% Comment on the relationship between the poles and zeros and the frequency content
disp('Z-Transform Analysis:');
disp('Poles are the points inside the unit circle and zeros are on the unit circle.');
disp('Stable systems have poles inside the unit circle.');
disp('The frequencies with significant energy in the signal will correlate with zeros on the unit circle.');
disp('The stability of the system is related to the position of the poles in the Z-plane.');
% Step 5: Optional - Listen to the audio signal
% sound(audio_signal, fs); % Uncomment to play the audio signal
clear; clc; close all;
% Define filter specifications
Fs = 44100;  % Sampling frequency (Hz)
Fc = 5000;   % Cutoff frequency (Hz)
N = 50;      % Filter order
% Design a low-pass FIR filter using a Hamming window
b = fir1(N, Fc/(Fs/2), 'low', hamming(N+1));
a = 1;
% Compute frequency response
[H, f] = freqz(b, a, 1024, Fs);
% Plot magnitude and phase response
figure;
subplot(2,1,1);
plot(f, abs(H));
title('Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('|H(f)|');
grid on;
subplot(2,1,2);
plot(f, angle(H));
title('Phase Response');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
grid on;
% Load an audio file
disp('Loading audio file...');
[audioData, Fs] = audioread('audiofile.wav');
% Apply filter to the audio file
filteredAudio = filter(b, a, audioData);
disp('Playing original audio...');
audioOrig = audioplayer(audioData, Fs);
playblocking(audioOrig);
disp('Playing filtered audio...');
audioOut = audioplayer(filteredAudio, Fs);
playblocking(audioOut);
disp('Filtered audio playback complete.');
clc; clear; close all;

% Define a simple low-pass digital filter (Butterworth)
[b, a] = butter(3, 0.4);  % 3rd order, cutoff at 0.4*pi rad/sample

% Frequency response
[H, w] = freqz(b, a, 512);  % 512 frequency points

% Plot magnitude and phase
subplot(2,1,1);
plot(w/pi, abs(H));
title('Magnitude Response');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('|H(w)|'); grid on;

subplot(2,1,2);
plot(w/pi, angle(H));
title('Phase Response');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Phase (radians)'); grid on;

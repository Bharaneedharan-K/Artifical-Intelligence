clc; clear; close all;

%% 1. Define input signal x(n) and impulse response h(n)
x = [1 2 3 4];        % Example input signal
h = [1 -1 2];         % Example filter (impulse response)

%% 2. Perform linear convolution
y = conv(x, h);       % Convolved output

%% 3. Plot all signals
n_x = 0:length(x)-1;
n_h = 0:length(h)-1;
n_y = 0:length(y)-1;

figure;

subplot(3,1,1);
stem(n_x, x, 'filled'); title('Input Signal x(n)');
xlabel('n'); ylabel('x(n)'); grid on;

subplot(3,1,2);
stem(n_h, h, 'filled'); title('Impulse Response h(n)');
xlabel('n'); ylabel('h(n)'); grid on;

subplot(3,1,3);
stem(n_y, y, 'filled'); title('Output y(n) = x(n) * h(n)');
xlabel('n'); ylabel('y(n)'); grid on;

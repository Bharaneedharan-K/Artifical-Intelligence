% MATLAB Program to generate and visualize common signals and analyze RC circuit response

clc;
clear;
close all;

%% Time definitions
t = -2:0.01:2;       % Continuous-time range
n = -20:1:20;        % Discrete-time range
T = 0.1;             % Sampling period for discrete signals
RC = 1;              % RC circuit time constant

%% Signal Definitions
% Step Signal
step_ct = t >= 0;
step_dt = n >= 0;

% Impulse Signal
impulse_ct = t == 0;
impulse_dt = n == 0;

% Exponential Signal
exp_ct = exp(-t) .* (t >= 0);
exp_dt = exp(-n*T) .* (n >= 0);

% Ramp Signal
ramp_ct = t .* (t >= 0);
ramp_dt = n .* (n >= 0);

% Sine Signal
sine_ct = sin(2*pi*t);
sine_dt = sin(2*pi*n*T);

%% Visualization of Signals
figure;

% Continuous-time Signals
subplot(5, 2, 1); plot(t, step_ct, 'r', 'LineWidth', 1.5); grid on;
title('Continuous Step Signal'); xlabel('t'); ylabel('Amplitude');

subplot(5, 2, 3); plot(t, impulse_ct, 'g', 'LineWidth', 1.5); grid on;
title('Continuous Impulse Signal'); xlabel('t'); ylabel('Amplitude');

subplot(5, 2, 5); plot(t, exp_ct, 'b', 'LineWidth', 1.5); grid on;
title('Continuous Exponential Signal'); xlabel('t'); ylabel('Amplitude');

subplot(5, 2, 7); plot(t, ramp_ct, 'm', 'LineWidth', 1.5); grid on;
title('Continuous Ramp Signal'); xlabel('t'); ylabel('Amplitude');

subplot(5, 2, 9); plot(t, sine_ct, 'k', 'LineWidth', 1.5); grid on;
title('Continuous Sine Signal'); xlabel('t'); ylabel('Amplitude');

% Discrete-time Signals
subplot(5, 2, 2); stem(n, step_dt, 'r', 'LineWidth', 1.5); grid on;
title('Discrete Step Signal'); xlabel('n'); ylabel('Amplitude');

subplot(5, 2, 4); stem(n, impulse_dt, 'g', 'LineWidth', 1.5); grid on;
title('Discrete Impulse Signal'); xlabel('n'); ylabel('Amplitude');

subplot(5, 2, 6); stem(n, exp_dt, 'b', 'LineWidth', 1.5); grid on;
title('Discrete Exponential Signal'); xlabel('n'); ylabel('Amplitude');

subplot(5, 2, 8); stem(n, ramp_dt, 'm', 'LineWidth', 1.5); grid on;
title('Discrete Ramp Signal'); xlabel('n'); ylabel('Amplitude');

subplot(5, 2, 10); stem(n, sine_dt, 'k', 'LineWidth', 1.5); grid on;
title('Discrete Sine Signal'); xlabel('n'); ylabel('Amplitude');

%% First-order RC Circuit Response
% RC Transfer Function: H(s) = 1 / (RCs + 1)
H = tf([1], [RC, 1]);

% Input Signals
inputs = {step_ct, impulse_ct, exp_ct, ramp_ct, sine_ct};
input_names = {'Step', 'Impulse', 'Exponential', 'Ramp', 'Sine'};

% Circuit Response Analysis
figure;
for i = 1:length(inputs)
    input_signal = inputs{i};
    
    % Compute circuit response
    [y, t_out] = lsim(H, input_signal, t);
    
    % Plot input and response
    subplot(length(inputs), 2, 2*i-1); plot(t, input_signal, 'LineWidth', 1.5); grid on;
    title(['Input: ', input_names{i}]); xlabel('t'); ylabel('Amplitude');
    
    subplot(length(inputs), 2, 2*i); plot(t_out, y, 'LineWidth', 1.5); grid on;
    title(['RC Response to ', input_names{i}]); xlabel('t'); ylabel('Amplitude');
end
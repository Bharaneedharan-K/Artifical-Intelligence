clc;
clear;

% Time vectors
t = 0:0.01:5;          % Continuous time
n = 0:1:50;            % Discrete time
RC = 1;                % Time constant for RC circuit

% --- CONTINUOUS-TIME SIGNALS ---
% Step signal
u_ct = ones(size(t));

% Impulse signal (approximated)
imp_ct = zeros(size(t));
imp_ct(t==0) = 1;

% Exponential signal
exp_ct = exp(-t/RC);

% Ramp signal
ramp_ct = t;

% Sine wave
sine_ct = sin(2*pi*1*t);

% --- DISCRETE-TIME SIGNALS ---
% Step signal
u_dt = ones(size(n));

% Impulse signal
imp_dt = zeros(size(n));
imp_dt(n==0) = 1;

% Exponential signal
exp_dt = exp(-n/RC);

% Ramp signal
ramp_dt = n;

% Sine wave
sine_dt = sin(2*pi*1*n/length(n)*10);  % adjust frequency

% --- PLOTTING ---

figure('Name','Continuous-Time Signals','NumberTitle','off');
subplot(3,2,1); plot(t, u_ct); title('Step (CT)'); grid on;
subplot(3,2,2); plot(t, imp_ct); title('Impulse (CT)'); grid on;
subplot(3,2,3); plot(t, exp_ct); title('Exponential (CT)'); grid on;
subplot(3,2,4); plot(t, ramp_ct); title('Ramp (CT)'); grid on;
subplot(3,2,5); plot(t, sine_ct); title('Sine (CT)'); grid on;

figure('Name','Discrete-Time Signals','NumberTitle','off');
subplot(3,2,1); stem(n, u_dt); title('Step (DT)'); grid on;
subplot(3,2,2); stem(n, imp_dt); title('Impulse (DT)'); grid on;
subplot(3,2,3); stem(n, exp_dt); title('Exponential (DT)'); grid on;
subplot(3,2,4); stem(n, ramp_dt); title('Ramp (DT)'); grid on;
subplot(3,2,5); stem(n, sine_dt); title('Sine (DT)'); grid on;

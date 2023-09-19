clear all
format long
nSamples = 8000;

fsw = [1, 50]; %kHz
dudt = [5, 30]; %V/ns
Cap = [10e-6, 5000e-6]; %uF 
CyCap = [1e-9, 250e-9]; %nF 
raEmi = [0.012, 0.06]; % m  
laEmi = [0.01, 0.06]; % m  
nChip = [1, 30];
Achip = [20, 35]; %mm² 

% Generate LHS samples using lhsdesign
samples = lhsdesign(nSamples, 8);

% Scale the integer parameters
samples(:, 1) = round(fsw(1) + samples(:, 1) * (fsw(2) - fsw(1)));   % Round to nearest integer
samples(:, 2) = round(dudt(1) + samples(:, 2) * (dudt(2) - dudt(1)));   % Round to nearest integer
samples(:, 8) = round(Achip(1) + samples(:, 8) * (Achip(2) - Achip(1)));   % Round to nearest integer

% Scale the floating-point parameters
samples(:, 3) = Cap(1) + samples(:, 3) * (Cap(2) - Cap(1));
samples(:, 4) = CyCap(1) + samples(:, 4) * (CyCap(2) - CyCap(1));
samples(:, 5) = round(raEmi(1) + samples(:, 5) * (raEmi(2) - raEmi(1)),4);
samples(:, 6) = round(laEmi(1) + samples(:, 6) * (laEmi(2) - laEmi(1)),4);
samples(:, 7) = round(nChip(1) + samples(:, 7) * (nChip(2) - nChip(1)),2);

% Round to two decimal places
samples(:, 3) = round(samples(:, 3) * 1e3, 2) / 1e3;
samples(:, 4) = round(samples(:, 4) * 1e8, 2) / 1e8;

input_sample = samples;

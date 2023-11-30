clc; clear all;
% Sampling frequency and interval
fs = 16000;
Ts = 1/fs;

% Starting frequency and increase slope
f1 = 100;
mu = 2000;

% Make the time vector for replayed sound spurt
% Play the spurt for 2 seconds
tfinal = 8;
nsound=0:Ts:tfinal;

% Make the time vector for the plot
nplot=0:Ts:(2000-1)*Ts;

% Sample the sinusoid.
cnT = cos(pi*mu*nsound.^2 + 2*pi*f1*nsound);

% Make the plot
plot(nplot, cnT(1:2000));
title('16 kHz Sampling Frequency');

% Save cnT as a wav sound file, soundfile.wav.
audiowrite('soundfile_chirp_2.wav', cnT, fs);

% Uncomment/edit this next line to save the graph.
exportgraphics(gcf, 'graph_chirp_2.jpg');
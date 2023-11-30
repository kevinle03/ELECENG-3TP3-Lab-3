clc; clear all;
% Sampling frequency and interval
fs = 8000;
Ts = 1/fs;

% Set time duration of plot, i.e., 10 msec.
tfinalplot = 10e-3;

% Make the time vector for the plot
nplot=0:Ts:tfinalplot;

% Make the time vector for replayed sound spurt
% Play the spurt for 2 seconds
tfinal = 2;
nsound=0:Ts:tfinal;

%vector for the four 2-second tone segments
xnT_concat = [];

frequencies = [100 200 400 800];

for i = 1:4
    % Use sinusoid frequency f = 100, 200, 400, 800 Hz
    f = frequencies(i);

    % Sample the sinusoid.
    xnT = sin(2*pi*f*nsound);
    xnT_concat = [xnT_concat xnT];
    
    % Make the plot
    my_title = [int2str(f) ' Hz'];
    subplot(2,2,i);
    plot(nplot, xnT(1:length(nplot)));
    title(my_title);
end

% Save xnT as a wav sound file, soundfile.wav.
audiowrite('soundfile.wav', xnT_concat, fs);

% Uncomment/edit this next line to save the graph.
exportgraphics(gcf, 'graph_2.jpg');

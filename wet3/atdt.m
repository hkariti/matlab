function [ dial_vec ] = atdt( str )

fs = 10000;
tone_duration = 200e-3;
silence_duration = 50e-3;
tone_samples = tone_duration*fs;
silence_samples = silence_duration*fs;

% Preallocate the output vector
dial_vec = zeros(1, tone_samples*length(str) + silence_samples*(length(str)-1)+1);
% Start creating the samples vector and plot it as we go
current_dial_index = 1;
current_silence_index = 1;
figure(1);
title("Signal for given string");
xlabel("Time (1/10000 s)");
ylabel("Voltage");
hold all;
for i = 1:length(str(:))
    % Get the current char's samples and add them to output vector
    tones = single_dtmf(str(i), tone_samples + (i == 1));
    x_tones = current_dial_index:current_dial_index+tone_samples-1 + (i==1);
    dial_vec(x_tones) = tones;
    % Generate silence samples, for plotting only
    x_silences = current_silence_index:current_dial_index-1;
    silences = zeros(1, length(x_silences));
    % Plot both types of samples
    stem(x_tones, tones, 'blue');
    stem(x_silences, silences, 'green');
    % Increment pointers
    current_silence_index = current_dial_index + tone_samples;
    current_dial_index = current_silence_index + silence_samples;
end

end


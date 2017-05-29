function [ ring_intervals ] = find_ring_intervals( samples )
    silence_or_tone = samples < 1e-5;
    % Filter out single silence samples
    % We treat before the first and after the last samples as tone,
    % because we want to filter out a single silence at the first or
    % last sample
    st_shift_left = circshift(silence_or_tone, -1);
    st_shift_left(end) = 0;
    st_shift_right = circshift(silence_or_tone, 1);
    st_shift_right(1) = 0;
    % The actual filter - silence are allowed if they have a silence before
    % or after them
    st_filtered = or(and(silence_or_tone, st_shift_left), and(silence_or_tone, st_shift_right));
    
    % Find silence-to-tone and tone-to-silence transitions
    st_shift_left = circshift(st_filtered, -1);
    st_shift_right = circshift(st_filtered, 1);
    % Detect tone at the first and last sample, so treat samples
    % before/after them as silence
    st_shift_left(end) = 1;
    st_shift_right(1) = 1;
    
    tone_to_silence = find(and(not(st_filtered), st_shift_left));
    silence_to_tone = find(and(not(st_filtered), st_shift_right));
    
    % Fill output matrix
    ring_intervals = [ transpose(silence_to_tone) transpose(tone_to_silence) ];
    % Be on the safe side for empty value check in tests...
    if (isempty(ring_intervals))
        ring_intervals = [];
    end
end


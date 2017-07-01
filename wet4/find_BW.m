function [ BW ] = find_BW( H , accuracy )
f0 = 75e6;
H_peak = 0.5;
cutoff = H_peak/sqrt(2);
BW_max = 50e6;
right_side = f0:accuracy/4:(f0+BW_max);
left_side = f0:-accuracy/4:(f0-BW_max);

cutoff_right = cutoff_search(right_side, cutoff, H);
cutoff_left = cutoff_search(left_side, cutoff, H);
BW = cutoff_right - cutoff_left;
end


function [ info_bits ] = extract_info_amuned( bin_vec60 )

downsampled_2 = bin_vec60(2:6:end);
downsampled_3 = bin_vec60(3:6:end);
downsampled_4 = bin_vec60(4:6:end);

downsampled_unified = [ downsampled_2; downsampled_3; downsampled_4 ];
downsampled_corrected = mode(downsampled_unified);
info_bits = downsampled_corrected(2:9);
end


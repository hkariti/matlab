function [ info_bits ] = extract_info( bin_vec60 )

downsampled = bin_vec60(1:6:end);
info_bits = downsampled(2:9);

end


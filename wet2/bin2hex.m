function [ hex_info ] = bin2hex( bin_info )

num_digits = length(bin_info)/4;
[X, Y] = meshgrid(1:4, 1:num_digits);
ind_matrix = 4.*(Y - 1) + X;
digits = bin_info(ind_matrix);
hex_info = join(transpose(dec2hex(bin2dec(join(string(digits))))));

end
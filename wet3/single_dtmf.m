function [ tone ] = single_dtmf( button , N)
fs = 10000;
char_mat = [ '1' '2' '3'; '4' '5' '6'; '7' '8' '9'; '*' '0' '#' ];
col_freq = [ 1209 1336 1477 ];
row_freq = [ 697 770 852 941 ];

[row, col] = find(char_mat == button);

wave = @(t)1/2 * cos(2*pi*col_freq(col).*t) + ...
    1/2 * cos(2*pi*row_freq(row).*t);
t_vec = (0:N-1)./fs;

tone = wave(t_vec);

end


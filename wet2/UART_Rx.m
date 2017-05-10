function [ hex_info ] = UART_Rx( samples )
current_ind = 1;
hex_info = "";
while ( current_ind < length(samples) )
    posedge = find_first_posedge(samples, current_ind);
    bin_info = extract_info(samples(posedge:posedge+59));
    hex_info = strcat(hex_info, bin2hex(bin_info));
    current_ind = posedge + 60
end
end


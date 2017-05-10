function [ hex_info ] = UART_Rx( samples )
hex_info = [];
current_ind = 1;
posedge = find_first_posedge(samples, current_ind);
while ( ~isempty(posedge) )
    bin_info = extract_info(samples(posedge:posedge+59));
    hex_info = strcat(hex_info, bin2hex(bin_info));
    current_ind = posedge + 60;
    posedge = find_first_posedge(samples, current_ind);
end
end


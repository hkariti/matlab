function [ cutoff_point ] = cutoff_search( values, cutoff_value, H )
current_length = length(values);
current_index = 1 + floor(current_length/2);
while (current_length > 0)
    current_freq = values(current_index);
    current_value = abs(double(H(current_freq)));
    if (current_value > cutoff_value)
        current_length = floor(current_length/2);
        current_index = current_index + current_length;
    elseif (current_value < cutoff_value)
        current_length = floor(current_length/2);
        current_index = current_index - current_length;
    end
end
cutoff_point = current_freq;
end


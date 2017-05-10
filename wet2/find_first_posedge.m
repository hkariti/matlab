function [ posedge ] = find_first_posedge( bin_vec , ind )
if ind > length(bin_vec)
    posedge = [];
    return
end
posedge = ind - 1 + find(bin_vec(ind:end), 1);

end


function [ s_n_vals ] = s_n(n , tau , time_vec )

cos_k = @(k, t, tau)cos(2*pi*k.*t/tau);
coeff = a_n_coefs(n);

cos_n_t_mat = cos_k(transpose(0:n), time_vec, tau);

cos_n_t_with_coeff = transpose(coeff) .* cos_n_t_mat;

s_n_vals = sum(cos_n_t_with_coeff, 1);

end


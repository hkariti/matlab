function [ y_n_vals ] = y_n( n , R , C , tau , time_vec )

cos_k = @(k, t, tau, phi)cos(2*pi*k.*t/tau + phi);
coeff_phase  = r_n_coefs(n, R, C, tau);

cos_n_t_mat = cos_k(transpose(0:n), time_vec, tau, transpose(coeff_phase(2,:)));

cos_n_t_with_coeff = transpose(coeff_phase(1,:)) .* cos_n_t_mat;

y_n_vals = sum(cos_n_t_with_coeff, 1);


end


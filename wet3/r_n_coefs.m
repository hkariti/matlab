function [coefs_mat] = r_n_coefs( n , R , C , tau )

a_n = a_n_coefs(n);
H = @(R,C, omega)1./(1 + 1i.*omega.*R.*C);
omega = @(k)2*pi.*k./tau;

H_complex = H(R, C, omega(0:n));

coefs_mat = [ abs(H_complex); angle(H_complex) ];
end


function [ coefs ] = a_n_coefs( n )

a0 = 0.25;
coeff_k = @(k)2./(pi*k) .* sin(pi*k/2);

a_n = coeff_k(1:n);

coefs = [ a0 a_n ];
end


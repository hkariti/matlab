function [ H ] = trans_func( f0 , BW , R)

syms f L C;
series = @(z) sum(z);
parallel = @(z) 1/sum(1./z);
vol_divide = @(z_in, z_out) z_out/(z_in + z_out);
g = @(k)sin((2*k-1)*pi/8);
L1 = g(1)*R/(pi*BW);
C1 = 1/(L1*(2*pi*f0)^2);
C2 = g(2)/(pi*BW*R);
L2 = 1/(C2*(2*pi*f0)^2);
L3 = g(3)*R/(pi*BW);
C3 = 1/(L3*(2*pi*f0)^2);
C4 = g(4)/(pi*BW*R);
L4 = 1/(C4*(2*pi*f0)^2);
z_L(f, L) = 1j*2*pi*f*L;
z_C(f, C) = 1/(1j*2*pi*f*C);

Zin_1 = series([R, z_L(f, L1), z_C(f, C1)]);
Zout_1 = parallel([z_L(f, L2), z_C(f, C2)]);
Zeq_1 = parallel([Zin_1, Zout_1]);
H_1 = vol_divide(Zin_1, Zout_1);

Zin_2 = series([Zeq_1, z_L(f, L3), z_C(f, C3)]);
Zout_2 = parallel([z_L(f, L4), z_C(f, C4), R]);
H_2 = vol_divide(Zin_2, Zout_2);

H(f) = H_1 * H_2;
H = simplify(H);
end


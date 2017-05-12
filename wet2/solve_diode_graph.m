function [ Vd , Id ] = solve_diode_graph( Ieq , Req , Vd_vec )
I_0 = 1e-12;
KTq = 0.026;
f1 = @(Vd)I_0*(exp(Vd/KTq) - 1);
f2 = @(Vd)Ieq - Vd/Req;

I1 = f1(Vd_vec);
I2 = f2(Vd_vec);

diff = abs(I1-I2);
[~, min_pos] = min(diff);
Vd = Vd_vec(min_pos);
Id = I1(min_pos);

plot(Vd_vec, I1, 'b', Vd_vec, I2, 'g');
xlim([Vd_vec(1), Vd_vec(round(1.1*min_pos))]);
end


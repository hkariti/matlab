function [ Vd , Id ] = solve_diode_graph( Ieq , Req , Vd_vec )
% Calculate Id in both ways
I_0 = 1e-12;
KTq = 0.026;
f1 = @(Vd)I_0*(exp(Vd/KTq) - 1);
f2 = @(Vd)Ieq - Vd/Req;

I1 = f1(Vd_vec);
I2 = f2(Vd_vec);

% Find intersection
diff = abs(I1-I2);
[~, min_pos] = min(diff);
Vd = Vd_vec(min_pos);
Id = I1(min_pos);
% Calculate graph limits
lower_limit = min_pos - 10;
higher_limit = min_pos + 10;
if (lower_limit < 1)
    lower_limit = 1;
end
if (higher_limit > length(Vd_vec))
    higher_limit = length(Vd_vec);
end
y_limits = sort([I2(higher_limit), I2(lower_limit)]);
x_limits = [Vd_vec(lower_limit), Vd_vec(higher_limit)];
% Plot graph
plot(Vd_vec, [I1; I2], '-x');
xlim([x_limits(1), x_limits(2)]);
ylim([y_limits(1), y_limits(2)]);
end


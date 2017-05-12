function [ Vd , Id ] = solve_diode_iter( Ieq , Req  )
% Constants
MAX_RUNS = 7;
V_ACCURACY = 1e-4;
KTq = 0.026;
I_0 = 1e-12;
f_rev = @(I)KTq*log(I/I_0 + 1);
V_0 = Ieq*Req/2;
% Init vars
Vd = [];
Id = [];
% Start running
currentV = V_0;
run = 1;
still_running = true;
while (still_running)
    prevV = currentV;
    currentI = Ieq - prevV/Req;
    currentV = f_rev(currentI);
    run = run + 1;
    still_running = (abs(currentV - prevV) >= V_ACCURACY ) && ...
        run <= MAX_RUNS;
end
Vd = currentV;
Id = currentI;
end
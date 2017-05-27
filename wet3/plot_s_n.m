function [ ] = plot_s_n( num1 , num2 , tau )
t_vec = linspace(-tau/2, tau/2);
s1 = s_n(num1, tau, t_vec);
s2 = s_n(num2, tau, t_vec);

figure(1);
plot(t_vec, [s1; s2]);
title("Fourier approx of square wave");
xlabel("Time (sec)");
ylabel("Voltage");
num1_label = sprintf("%d elements", num1);
num2_label = sprintf("%d elements", num2);
legend(num1_label, num2_label, "Location", "NorthEast");
end


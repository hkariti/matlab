function [ ] = plot_y_50( tau1 , tau2 , tau3 )

R = 1.2;
C = 1;

t_vec1 = linspace(-5*tau1, 5*tau1, 200);
t_vec2 = linspace(-5*tau2, 5*tau2, 200);
t_vec3 = linspace(-5*tau3, 5*tau3, 200);

y_50_1 = y_n(50, R, C, tau1, t_vec1);
y_50_2 = y_n(50, R, C, tau2, t_vec2);
y_50_3 = y_n(50, R, C, tau3, t_vec3);

figure();
subplot(3, 1, 1);
plot(t_vec1, y_50_1);
title(sprintf("Output for tau=%d", tau1));
xlabel("Time (sec)");
ylabel("Voltage");
grid();

subplot(3, 1, 2);
plot(t_vec2, y_50_2);
title(sprintf("Output for tau=%d", tau2));
xlabel("Time (sec)");
ylabel("Voltage");
grid();

subplot(3, 1, 3);
plot(t_vec3, y_50_3);
title(sprintf("Output for tau=%d", tau3));
xlabel("Time (sec)");
ylabel("Voltage");
grid();

end


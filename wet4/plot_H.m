function [] = plot_H( H , f0 , BW )

figure();
s1 = subplot(2, 1, 1);
s2 = subplot(2, 1, 2);
xspace = logspace(-0.8+log10(f0-BW/2), 0.8+log10(f0+BW/2), 250);
H_vals = double(H(xspace));
H_size = 20*log10(abs(H_vals));
H_phase = angle(H_vals);

semilogx(s1, xspace, H_size);
semilogx(s2, xspace, H_phase);
title(s1, "Butterworth filter gain by frequency");
xlabel(s1, "Frequency (Hz)");
ylabel(s1, "Gain (dB)");
title(s2, "Butterworth filter phase difference by frequency");
xlabel(s2, "Frequency (Hz)");
ylabel(s2, "Phase difference (rad)");
grid(s1);
grid(s2);
end


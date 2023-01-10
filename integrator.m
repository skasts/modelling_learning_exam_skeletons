close all
clc

% first order integrator system: A and C polynomials
d = 1;
A = [1 -d];
C = 1;

e = randn(10000, 1); % white noise input
w = filter(C, A, e); % output

acf(w, 30, 0.05, 1); % autocorrelation function (signal, number of taps, confidence interval, plot)

figure
plot(w)

figure
hold on
periodogram(w)
pwelch(w)
pburg(w, 7)
legend('periodogram', 'welch', 'burg')
%% 2). 
% a) x1 - MSI method, x2 - SIB method
x1 = [0.39 0.84 1.76 3.35 4.69 7.70 10.5 10.92];
x2 = [0.36 1.35 2.56 3.92 5.35 8.33 10.70 10.91];

[h, p, ci] = ttest(x1, x2, alpha=0.01)

% b) Test the mean difference = 0 at 5%. Using the rejection region method,
% we want to test
% H_0: mu_D = 0 and H_a: mu_D /= 0 
% This is a two-sided one sample t-test. The region region is given as 
% [0-t_[0.975,7] * s_D/sqrt(n), 0+t_[0.975,7] * s_D/sqrt(n)]
% gives us [-0.2667, 0.2667]. Note that dbar = -0.4162 -> reject H0. 

% c) check normality

%% 3). n1 = 45, xbar1 = 42500, s1 = 2200, n2 = 45, xbar2 = 40400, s2 = 1500
% a) Test H0 : mu_1 = mu_2 versus H_a: mu_1 /= mu_2 at the alpha = 0.05
% level.
n1 = 45; xbar1 = 42500; s1 = 2200; n2 = 45; xbar2 = 40400; s2 = 1500;

% We have two independent samples.
t = ((xbar1 - xbar2))/(s_p*sqrt(1/n1 + 1/n2));
% since mu_1 - mu_2 = 0 according to null hypothesis
s_p = sqrt(((n1-1)*s1^2 + (n2-1)*s2^2)/(n1+n2-2));
nu = n1+n2-2;

[(xbar1-xbar2)-tinv(1-alpha/2, nu)*s_p*sqrt(1/n1 + 1/n2), 
 (xbar1-xbar2)+tinv(1-alpha/2, nu)*s_p*sqrt(1/n1 + 1/n2)]
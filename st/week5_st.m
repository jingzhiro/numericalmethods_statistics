%% 1. 
% a) Construct a density histogram of the shear strengths. 
% Comment on the shape of the distribution.
histogram(shearstrength, 10, 'Normalization', 'pdf');
% unimodal, bell-shaped, seems to be normally distributed 

% b) Is it plausible that the sample was selected from a normal 
% distribution? Draw a normal quantile plot and conclude.
figure
qqplot(shearstrength);
% The data is an excellent approximation to normality.

% c) σ =350 lb, Estimate µ, the true mean shear strength and give a 95% 
% two-sided confidence interval for it. Interpret your result.
[h, p, ci] = ztest(shearstrength, mean(shearstrength), 350,"Alpha", 0.05)
% Therefore, we are 95% confident that the true mean shear strength lies
% within [4980.6, 5117.8] lb, assuming that the true standard deviation is
% given as 350 lb. 

% d) Suppose σ is not known. Give a 95% two-sided confidence interval 
% for µ. Interpret your result. Compare with the previous confidence 
% interval, and explain why they are different.
[h_t, p_t, ci_t] = ttest(shearstrength, mean(shearstrength), 'alpha', 0.05)

% From ci_t, we are 95% confident that the true mean shear strength is
% within [4979.4, 5118.9] lb. The CI is wider as we use the sample
% deviation.

in this situation (without assuming σ is known), we are 95% confident that the true value µ
 lies in [4979.4,5118.9]. This interval is indeed slightly wider than the previous one, but not that
 much. That is because n is large, so that the Student distribution with many degrees of freedom
 (here: n−1 = 99 degrees of freedom) is pretty much like the standard normal distribution. Another
 reason for this interval to be wider than the one found in c) is that the estimated standard deviation
 s =351.4525 is also slightly larger than the assumed σ = 350 in c).





%% 2. a) porevolume.txt
%  a. Is it plausible that the sample was selected from a normal population 
% distribution? Show a density histogram and a normal quantile plot and 
% conclude.
histogram(porevolume, 5, 'Normalization', 'pdf');

% It is not particularly obvious that the underlying distribution can be
% well approximated by a normal distribution. However, there is no strong
% evidence against normality either as a consequence of the small sample
% size.

figure;
qqplot(porevolume);

% b. Determine a 98% CI for the true average amount of residual gas 
% saturation
xbar = mean(porevolume)
[h, p, ci] = ttest(porevolume,xbar,'alpha',0.02)

% otherwise, computing manually, we have
s = std(porevolume)
n = length(porevolume)
ci = [xbar - tinv(0.99, 17)*(s/sqrt(n)), xbar + tinv(0.99, 17)*(s/sqrt(n))]

% c. Determine a 95% CI for the true average amount of residual gas 
% saturation. How does this differ from the 98% CI from part b?
[h_2, p_2, ci_2] = ttest(porevolume,xbar,'alpha',0.05);
ci_2

% The 95% CI is within the 98% CI. 

%% 3.

% a. Simulate a matrix C with 36 rows and 500 columns containing elements 
% that are independent values drawn from the Normal distribution with 
% µ = 20 and σ = 5. You can think of each column of C as being a random 
% sample of size 36 from X ∼ N(20,5). With 500 columns in C, we have 500 
% independent random samples of size 36.
n = 500
C = normrnd(20, 5, 36, n)

% b. Follow the steps below to calculate 95% z- and t-confidence intervals 
% for µ from each sample.

% i. Compute the sample mean of each of the 500 samples
xBarC = mean(C);

% ii. Compute the sample standard deviations of each of the 500 samples
sC = std(C);

% iii. From the given expression of the z-confidence interval, we can
% compute the vector of upper bounds
CI_norm_U = xBarC + norminv(0.975)*(sC/sqrt(36))

% iv. z-confidence CI lower bound vector
CI_norm_L = xBarC - norminv(0.975)*(sC/sqrt(36))

% v. t-confidence CI upper bound vector
CI_t_U = xBarC + tinv(0.975, 35)*(sC/sqrt(36))

% vi. t-confidence CI lower bound vector
CI_t_L = xBarC + tinv(0.025, 35)*(sC/sqrt(36))

% c. Out of the 500 z-confidence intervals, compute the no. of CIs which
% contain the true mean value of 20
sum((CI_norm_U>= 20).*(CI_norm_L<=20))/n
sum((CI_t_U>=20).*(CI_t_L<=20))/n







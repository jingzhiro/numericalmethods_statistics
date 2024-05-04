%% 1. 1 micron for true mean thickness, assume layer thickness is normally 
% distributed. 
silicon_width = [0.940,0.985,0.986,0.936,0.999,1.089,0.949,1.007,0.947,0.963];

% a. i) Conduct a hypothesis test to determine whether the true mean
% thickness differs from the target value of 1 micron. Use a significance
% level of 0.05.
[h,p,ci] = ttest(silicon_width, 1) % ttest method
% h is 1 if the test rejects the null hypothesis at the given significance
% level

% OR manually
% calculate observed test statistic
xbar = mean(silicon_width); s = std(silicon_width); n = length(silicon_width)
t.stat = (xbar - 1)/(s/sqrt(n)) % which follows the t_9 student t distribution
tcdf(-abs(t.stat),n-1) + (1-tcdf(abs(t.stat), n-1))

% a. ii) Construct a 95% confidence interval for the true current mean µ. 
% Use this interval to determine whether the mean thickness has changed 
% from its target value.
ci

% b) Discuss the relationship of the 95% confidence interval and the 
% corresponding hypothesis test.

% The 95% CI contains the true mean thickness of 1 micron, agrees with the
% hypothesis test also at a significant level of 0.05. It only makes sense
% to compare the two if they use the same significant level.

% c) Where possible, check the assumptions you made
% We assumed normality. We can check by using qqplot
qqplot(silicon_width)

%% 2) Ignition of substrate experiment
% n = 48, 16 resulted in ignition. The experimenters hope for at least a
% 50% ignition rate, and want to test for evidence that ignition rate is
% lower than this.

% a) State the appropriate null and alternative hypotheses, making sure you
% define all terms.

% Null hypothesis -> p_hat = 0.5 
% Alternate hypothesis -> p_hat < 0.5

% b) What is the sample proportion?
p_hat = 16/48

% c) What is the rejection region for the sample proportion, at the 0.05
% significant level
norminv(0.05)
% The critical value is -1.6449. The rejection region is given by
0.5 + norminv(0.05)*sqrt((0.5*(1-0.5))/48)
% The rejection region is given by [0, 0.3813)

% d) Is there evidence that the true ignition rate is less than 50%? 
% Since the observed sample proportion (~0.333) lies within the rejection
% region, this will lead to a rejection of H_0. Therefore, this agrees with
% the conclusion if we compare the observed test statistic with the
% critical value, as the observed test statistic (-2.3094) is less than the
% critical value of norminv(0.05) = -1.6449. We can also conduct the
% hypothesis test by computing the p-value, which is computed by
% normcdf(t.stat) = 0.0105. 

t.stat = (1/3 - 0.5)/sqrt((0.5*(1-0.5))/48)
normcdf(t.stat)

% e) What assumptions did you make in this test? Where possible, check if
% they were reasonable.


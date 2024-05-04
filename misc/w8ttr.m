%% 1)
% a. Plot a comparative boxplots to compare the log time taken to fuse the
% images for the two groups of subjects.
boxplot(logTime, treatment, "labels", ["No information", "Verbal and Visual"])
ylabel('log(time)')

% b) What method would you use to analyse the data? What does it assume? 
% Where possible, check these assumptions are reasonable.

% This data would require a two-sample t-test. We assume independent random
% samples. However, this depends on the study design and we cannot check
% for this assumption without additional information. Next, let us examine
% if assuming equal population variable is reasonable or not.
[std(logTime(treatment==1)) std(logTime(treatment==2))]
% s_1/s_2 = 0.9950, which is very close to 1. Therefore, it is reasonable
% to assume equal variance. % Next, we will check the normality assumption
% using the QQ-plots
subplot(1,2,1)
qqplot(logTime(treatment==1))
subplot(1,2,2)
qqplot(logTime(treatment==2))
% The qqplots indicate slight deviation from normality at the left tail,
% which suggests the sample is slightly skewed, but not significantly. We
% may assume normality. 

% c) Perform an appropriate test to assess whether log times differ by 
% groups. Carry out the test using a significance level of α = 0.05. 
% Include the statements of H0 and Ha, rejection criterion, observed value 
% of the test statistic, p-value, and your conclusion in plain language.

% H_0: mu_1 = mu_2, H_a: mu_1 /= mu_2
[h, p, ci, stat] = ttest2(logTime(treatment==1), logTime(treatment==2));
p
stat

% Manual
x = logTime(treatment==1);
y = logTime(treatment==2);
n_x = length(x); n_y = length(y);
xbar=mean(x); ybar=mean(y);
s_x = std(x); s_y = std(y);

s_p = sqrt(((n_x-1)*s_x^2 + (n_y-1)*s_y^2)/(n_x+n_y-2));
obs.tstat = (xbar-ybar)/(s_p*sqrt(1/n_x + 1/n_y));
obs.tstat
% The p-value is given by P(T < -|obs.tstat|) + P(T > |obs.tstat|)
tcdf(-abs(obs.tstat), n_x+n_y-2) + (1-tcdf((abs(obs.tstat)), n_x+n_y-2))

% The p-value is < 0.05. Therefore, we reject H_0 and conclude that log
% times do differ by group.

% Confidence interval method
% The 95% confidence interval for the difference of means between the two
% groups is
[xbar - ybar - tinv(0.975, 76)*s_p*sqrt(1/n_x + 1/n_y), xbar - ybar + tinv(0.975, 76)*s_p*sqrt(1/n_x + 1/n_y)]
% The 95% CI is [0.0608, 0.8003]. The 95% CI does not contain 0.
% Therefore, we reject the null hypothesis. 

%% 2)
% a) Which formula do you think is appropriate for constructing a 
% confidence interval for the difference in mean impedance for the front 
% and rear sensors? Why?

% We have paired observations in this case as it is the same car. We can
% define the sample of differences by
absdiff = abs1-abs2;

% b) Construct a 95% confidence interval for the difference in mean 
% impedance for front and rear sensors.Does location of sensor appear to 
% affect impedance?

% 95% CI is given by 
[h, p, ci] = ttest(absdiff);
% -> [-0.8989, -0.8625]

% The observed test statistic is 
obs.tstat = mean(absdiff)/(std(absdiff)/sqrt(100))
pp = tcdf(-abs(obs.tstat),99) + (1-tcdf(abs(obs.tstat),99))





% Let x2 be number of hours slept by single degree students and x1 be
% number of hours slept by double degree students.
x1 = sleep(doubleDegree == "Yes");
x2 = sleep(doubleDegree == "No");

x1bar = mean(x1); x2bar = mean(x2);
n1 = length(x1); n2 = length(x2);
s1 = std(x1); s2 = std(x2);
s_p = sqrt(((n1-1)*s1^2 + (n2-1)*s2^2)/deg)
deg = n1 + n2 - 2
t = (x1bar-x2bar)/(s_p*sqrt(1/n1 + 1/n2))

2*tcdf(t,deg)

e = tinv(0.975,deg)*s_p*sqrt(1/n1 + 1/n2)
[(x1bar - x2bar) - e, (x1bar - x2bar) + e]

%% 
x1 = log(rain(treatment == "seeded"));
x2 = log(rain(treatment == "unseeded"));
xbar1 = mean(x1); xbar2 = mean(x2);
n1 = length(x1); n2 = length(x2);
s1 = std(x1); s2 = std(x2);
s_p = sqrt(((n1-1)*s1^2 + (n2-1)*s2^2)/deg)
deg = n1 + n2 - 2
t = (xbar1-xbar2)/(s_p*sqrt(1/n1 + 1/n2))

1-tcdf(t, deg)

e = tinv(0.975,deg)*s_p*sqrt(1/n1 + 1/n2)
[(xbar1 - xbar2) - e, (xbar1 - xbar2) + e]

[h, p, ci] = ttest2(x1,x2, alpha=0.1)

%% x1 - before, x2 - after
x1 = [47 73 46 124 33 56 83 32 26 15];
x2 = [36 60 44 110 35 51 77 29 26 11];
mu_D = x1-x2

dbar = mean(mu_D);
s_d = std(mu_D);
n = length(mu_D);

t = dbar/(s_d/sqrt(n))
1 - tcdf(t,9)

%% x1 - before, x2 - after
x1 = [3,2,4,2,1,4,2,0,1,3,5,2];
x2 = [4,0,7,3,3,6,2,1,4,4,7,3];
muD = x1-x2;

dbar = mean(muD)
sD = std(muD);
n = length(muD);

t = dbar/(sD/sqrt(n))
nu = n-1

p = tcdf(t,nu)

%% x1 - cotton, x2 - acetate
x1 = [51.7,49.6,50.3,47.8,47.7,50.3,51.5,55.1,48.6,50.3,50.0,46.0];
x2 = [58.9,55.5,62.1,57.8,60.3,58.6,60.8,58.5,61.2,61.8,64.3,59.5];

[h, p, ci] = ttest2(x2,x1, alpha = 0.02)

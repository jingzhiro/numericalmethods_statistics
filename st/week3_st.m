%% 1. a)
% i. Compute (P(Y = 5))
binopdf(5, 20, 0.35)

% ii. Compute P(5 <= Y < 15)
% Note that P(5 <= Y < 15) = P(X <= 14) - P(X <= 4) as binomial is
% discrete.
binocdf(14, 20, 0.35) - binocdf(4, 20, 0.35)

% iii. Compute P(5 < Y <= 15)
binocdf(15, 20, 0.35) - binocdf(5, 20, 0.35)

% iv. Compute P(Y \in {1, 5, 9, 17})
sum(binopdf([1 5 9 17], 20, 0.35))

% v. Compute P(Y \notin {5, 13, 16})
1 - sum(binopdf([5 13 16], 20, 0.35))

%% 1. b)
% Y ~ Bin(10, 1/5). Y => question correct
% i. all 10 questions correct
binopdf(10, 10, 1/5)
% equivalent to
nchoosek(10, 10) * (1/5)^(10)

% ii. at least 5 questions correct
sum(binopdf([1 2 3 4 5], 10, 1/5))

% iii. 3 quizzes, 5/10 on at least one quiz
1 - (1 - sum(binopdf([1 2 3 4 5], 10, 1/5)))^3

%% 2. a) poisspdf/poisscdf
% i. For Q ~ P(7), compute P(Q <= 3)
poisscdf(3, 7)

% ii. Compute P(Q < 3)
poisscdf(3, 7)

% iii. P((Q = 19) \or (Q = 20))
poisspdf(19, 7) + poisspdf(20, 7)

% iv. P(Q > 0)
1 - poisspdf(0, 7)

%% 2. b) poisspdf/poisscdf
% i. For Q ~ P(1), compute P(Q >= 2)
1 - poisscdf(2, 1)

% ii. How many cubic light-years of space must be studied such that the
% probability of one or more stars exceeds 0.95? 

% i don't know

%% 3. a) unifpdf/unifcdf
% i. For X ~ U[-1, 1], find P(X < 0)
unifcdf(0, -1, 1)

% ii. P(X <= 0)
unifcdf(0, -1, 1)

% iii. P(-0.9 <= X <= 0.8)
unifcdf(0.8, -1, 1) - unifcdf(-0.9, -1, 1)

% iv. x such that P(-x <= X <= x) = 0.9 
% unifcdf(x, -1, 1) - unifcdf(-x, -1, 1) = 0.9
% (x - 1)/2 - (-x - 1)/2 = 0.9
% x - 1 + x + 1 = 1.8
% 2x = 1.8
% x = 0.9
unifcdf(0.9, -1, 1) - unifcdf(-0.9, -1, 1) % = 0.9

%% 3. b)
% X ~ U[0.205, 0.215]
% P(X > 0.2125)
1 - unifcdf(0.2125, 0.205, 0.215)

% 1 - P(X > x) = 0.1, find x
% 1 - (x-0.205)/(0.01) = 0.1
% 0.01 - x + 0.205 = 0.001
% x = 0.214
1 - unifcdf(0.214, 0.205, 0.215) % = 0.1

%% 4. a) exppdf/expcdf
% W ~ Exp(2)
% i. P(W <= 2)
expcdf(2, 2)

% ii. P(W < 2) 
expcdf(2, 2)

% iii. P(10 < W < 13)
expcdf(13, 2) - expcdf(10, 2)

% iv. P(W > -5)
% 1

%% 4. b) exppdf/expcdf/expinv
% T ~ Exp(1/0.0003)
% i. P(T >= 10000)

% ii. P(T <= 7000)

% iii. 95% of the fans will last for at least which amount of time?
expinv(0.95, 1/0.0003)

%% 5. a) normpdf/normcdf/norminv
% Z ~ N(0, 1)
% i. Compute P(-1 < Z < 1)
normcdf(1, 0, 1) - normcdf(-1, 0, 1)

% ii. P(-2 < Z < 2)

% iii. P(-3 < Z < 3)

% iv. Comment on i, ii, iii
% The probabilities output the 68-95-99 rule.

% vi. 


%% 5. b) normpdf/normcdf/norminv
%

%% 6.a) qqplot
% For every following distribution, generate a random sample of size 
% n = 100, construct a normal quantile plot for this sample, and comment on
% how close the data are to normal

n = 100;
% i. N(3, 4)
x = normrnd(3, 4, n, 1);
qqplot(x)

% ii. U[0, 1]
figure
x = unifrnd(0, 1, n, 1);
qqplot(x)

% iii. Exp(4)
figure 
x = exprnd(4, n, 1);
qqplot(x)

% iv. Bin(20, 0.9)
figure 
x = binornd(20, 0.9, n, 1);
qqplot(x)

% v. P(9)
figure 
x = poissrnd(9, n, 1);
qqplot(x)

%% 7. disttool

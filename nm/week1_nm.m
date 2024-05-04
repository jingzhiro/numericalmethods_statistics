%% MATH2089 NM Tutorial Week 1 - Matlab

%% QUESTIONS 1

%  Download explot.m from Moodle and run it
explot

%% QUESTION 2

% (a) diplay pi
format      % restore the default setting
pi          % pi with standard format
format long
pi          % pi with format long 

% (b) round pi to 8 s.f. by hand
3.1415927
% (c) absolute and relative errors 
% p = 3.1416;
% abserr = abs(pi - p);
% relerr = abserr / abs(pi);

% (d) y = sin(x) with large x
x = 2e30
y = sin(x)

% (e) plot y = sin(x) with large x
k = 1:100;
y = sin(pi*10.^k);
plot(k, y, 'b*-')
xlabel('k')
ylabel('y_k')
title('sine')

% (f) Why do we get wrong answers in (d) and (e)?
% As pi is stored with limited precision, as x gets larger, the error 
% accumulation eventually gives an incorrect value in the standard range. 

%% QUESTION 3

% (a)
a = 0.75*0.2 - 0.15 % 0
% gives 10^-17 due to eps 

% (b)
b1 = floor(6/1) % 6
b2 = floor(0.6/0.1) % 6 
% gives 5 because b2 is 0.6/0.1 = 5.99999... 

% (c)
h = 1e-14;
c = 100+h-100 % should be h, but not quite

% (d)
h = 1e-15;
d = 100+h-100 % should be h, but gives 0 
% h is too small relative to 100
% i.e. think 100 + 1e-15 > 100, notice that will be less than eps

% (e)
eps
e1 = 1+eps>1   
e2 = 1+eps/2>1 


%% QUESTION 4

% (a)
a1 = 1/0       
a2 = -1/0      
a3 = log(0)    
a4 = log(-1)   

% (b)
b1 = 0/0         
b2 = Inf - Inf   
b3 = 0*Inf       
b4 = 0*NaN       
b5 = 1/Inf       


%% QUESTION 5

% learn to use help or doc 
help floor


%% QUESTION 6

% (a) largest finite and smallest positive numbers
realmax
realmin

% (b) largest integer n such that exp(n) is finite
n = floor(log(realmax))
b1 = exp(n)
b2 = exp(n+1)

% (c) exp(-x) for x = 700,710,...,800
x = 700:10:800
y = exp(-x)
small = exp(-740)
realmin

% Lesson: 
% * Overflow to Inf happens suddenly
% * Underflow to 0 happens gradually -> due to IEEE extended "subnormal
% numbers" and "denormalised numbers" 
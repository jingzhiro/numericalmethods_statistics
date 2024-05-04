%% 1. 
f = @(x) x.^3 - 6*x.^2 + 11*x - 6;
% a) Explain why f has at least one zero
% on the interval [0, 4]
f0 = f(0)
f4 = f(4)
% f(0)f(4) < 0 and f is continuous on the interval [0, 4] therefore f has
% at least one zero. 

% b) Plot over [0, 4]
figure(1)
t = linspace(0, 4, 101)
plot(t, f(t))
xlabel('x')
ylabel('f(x)')
title('f polynomial')
grid on

% c) Use fzero to find the precise values of the zeros in [0, 4]
fzero(f, [0.5 1.5]) % find a root between 0.5 and 1.5
fzero(f, [1.5 2.5]) % find a root between 0.5 and 1.5
fzero(f, 3.5) % find a root near 3.5 (risky)

%% 2. 
% f(x) = -e^(x+1) if x < 0,
%        x^2 - x + 1/2 otherwise
% a) Does f have a zero in [-1, 1]?
% It is not enough to check just the end points because f is not continuous
% at 0.
% We can check both 'pieces'
% For x in [-1, 0), f(x) <= f(-1) = -1
% For x in (0, 1], f(x) = (x-1/2)^2 + 1/4 >= 1/4
% So f does not have a zero in [-1, 1]

% b) Define the function
func = @(x) -exp(x+1) .* (x<0) + (x.^2 - x+1/2) .* (x>=0)

% c) Define the function f over [-2, 2] using 2001 equally spaced points
x = linspace(-2, 2, 2001)
y = func(x);
y(1001) = NaN % removes the data at x = 0 so it will not be cts
plot(x, y, 'b-', 0, func(0), 'r.') % adds a red dot at x=0

%% 3. Calculate 2^(1/3) using only basic arithmetic operations.
% a) Write this as a cubic polynomial
% x = 2^(1/3) => x^3 = 2 => x^3 - 2 = 0
% p(x) = x^3 - 2
% p'(x) = 3*x^2
p = @(x) x.^3 - 2;
dp = @(x) 3*x.^2; 

% b) At least one point on [1, 2]
% p is polynomial so cts
p(1) * p(2) % < 0 therefore at least one zero

% c) at most one zero on [1, 2]
% p'(x) = 3*x^2 > 0 [1, 2] 
% always positive p'(x) therefore strictly increasing
% therefore at most one zero on [1, 2]

% d) implement Newton's method
N = 10; % steps
x = zeros(1, N+1); % creates array of zeroes
x(1) = 1; % starting value

for k = 1:N
    x(k+1) = x(k) - p(x(k)) / dp(x(k));
end

format long e 
[x; p(x)]'

% For Newton's Method:
% p in C^2 and near simple root

%% 4. 
% For the function f(x) = (x-1)^3 
% a) What is the zero of f and what is its multiplicity? 
% The zero x = 1 has multiplicity 3

% b) Give an initial bracket on the zero
f = @(x) (x-1).^3;
df = @(x) 3*(x-1).^2
f(0) * f(2); % < 0. As f is a polynomial (cts), [0, 2] brackets a zero. 

% c) Implement Newton's method for this problem and perform 10 iterations
% starting from x_1 = 2
xtrue = 1;
N = 10;
x = zeros(1, N+1);
e = zeros(1, N+1);

x(1) = 2;
e(1) = abs(x(1) - xtrue);

fprintf('%2s %12s %12s %14s %14s\n', ...
        'k', 'e(k)', 'e(k+1)/e(k)', 'e(k+1)/e(k)^2', 'e(k+1)/e(k)^3')

for k = 1:N
    x(k+1) = x(k) - f(x(k)) / df(x(k));
    e(k+1) = abs(x(k+1) - xtrue);
    fprintf('%2d %12.2e %12.2e %14.2e %14.2e\n', ...
            k, e(k), e(k+1)/e(k), e(k+1)/e(k)^2, e(k+1)/e(k)^3);
end

% e) We see from the table of ratios of errors that the method converges
% linearly with rate constant 0.667 -> not the usual rate

%% 5.

% Consider using fixed point iteration to find a zero of f(x) = 2x - cos(x)
% a) Explain why f has a unique zero in [0, 1].
% f is cts
f = @(x) 2*x - cos(x);
f(0) * f(1) % < 0 therefore [0, 1] brackets at least one zero

df = @(x) 2 + sin(x) % > 0 strictly increasing therefore at most one zero
% therefore f has a unique zero in [0, 1]

% b) fixed point iteration
% 2x - cos(x) = 0 => x = cos(x)/2 so g(x) = cos(x)/2
% OR
% x = acos(2x) so g(x) = acos(2x)

% c) Justify convergence for any starting value in [0,1]
% g: [0, 1] -> [0, 1] i.e. g maps [0, 1] into itself
% g(x) = cos(x)/2
% g: [0,1] -> [0,1] i.e. g maps [0, 1] into itself
% g'(x) = -sin(x)/2 so |g'(x)| <= 1/2 < 1 GOOD
% Fixed point iteration converge linearly with rate ~1/2

% d) Implement fixed point iteration
f = @(x) 2*x - cos(x);
g = @(x) cos(x)/2;
N = 10;
x = zeros(1, N+1);
x(1) = 1/2;
for k = 1:N
    x(k+1)=g(x(k));
end

[x; f(x)]'







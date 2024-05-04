%% 1
err = 0.7999/0.6783

%% 2
f = @(n) (n.^3).*log(n) - 127981;
n = linspace(0, 100, 401);
plot(n, f(n))
grid on

fzero(f, [32 34])
f(33)

%% 3
% eps/h = h
% h = eps^(1/2)
h = eps^(1/2)

%% 4
2.169543E-4	/ 5.424975E-5
a = 2; b = 3;
alpha = (a+b)/2
beta = (b-a)/2

%% 5
format long e

f = @(x) sqrt(x-2);

a = 2; b = 5;
N = 128;
h = (b-a)/N;

x_eq = linspace(a, b, N+1);

w_trap = h * [1/2 ones(1, N-1) 1/2];
Q_trap = sum(w_trap .* f(x_eq))

I = (2*sqrt(27))/3;

E = abs(I - Q_trap)

%% 6
f = @(t,x) [x(2); -3*x(2)/5-x(1)/5];
h = 0.4; t0 = 1; tmax = 1.4
N = 1;
y0 = [10; 15]
[t, y] = math2089euler(f, t0, tmax, N, y0);
[t, y]

%% 7
f = @(t,x) [x(2); x(2) - 5*x(1)*t];
x0 = [2; 1]; y0 = x0;
h = 0.02; t0 = 3; tmax = 4;
N = 50;
[t, y] = math2089euler(f, t0, tmax, N, y0);
[t, y]

opt = odeset('RelTol', 1e-7, 'AbsTol', 1e-10);
[t, y] = ode45(f, [t0 tmax], y0, opt);
[t, y]

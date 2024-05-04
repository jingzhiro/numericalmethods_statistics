%% 1
e = 0.85
m = 0
while e > 10^-13
    e = 0.5 * e
    m = m + 1;
end

%% 2
f = @(n) (n.^3).*log(n) - 147882;
n = linspace(0, 100, 401);
plot(n, f(n))
grid on

fzero(f,[34 35])
f(35)

%% 3
h = eps^(1/2)

%% 4
a = 0; b = 1;
alpha = (a+b)/2
beta = (b-a)/2

%% 5

f = @(x) abs(sin(x)).*exp(-2*x/5)
x = linspace(1, 5, 601);
plot(x, f(x))
grid on

a = 1; b = 5;
integral(f, a, b, 'AbsTol', 1e-10, 'RelTol', 2e-8)

%% 6
f = @(t,x) [x(2); -3*x(2)/5-x(1)/5];
t0 = 1; tmax = 2; N = 5; h = 0.2;
y0 = [9; 17];

format long
[t, y] = math2089heun(f, t0, tmax, N, y0);
[t, y]

%% 7 
f = @(t,x) [x(2); x(2)*exp(-3*x(1)) - 2*t*x(1) + t^2]
x0 = [2;1];
y0 = x0; 
t0 = 3; tmax = 4; N = 10;

[t, y] = math2089euler(f, t0, tmax, N, y0);
[t, y]

opt = odeset('RelTol', 1e-7, 'AbsTol', 1e-10);
[t, y] = ode45(f, [t0, tmax], y0, opt);
[t, y]

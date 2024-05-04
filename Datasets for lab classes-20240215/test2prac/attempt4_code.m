%% 1
e2 = 0.42;
e3 = 0.1 * e2;
e4 = 0.1 * e3;
e5 = 0.1 * e4;
e6 = 0.1 * e5

e = 0.42; m = 0;
while e >= 10^-12
    e = 0.1*e
    m = m + 1
end
m

%% 2 
f = @(x) sin(pi*x).*exp(-x/3) - x.^2/15;
x = linspace(0, 5, 501);

plot(x, f(x))
grid on

fzero(f, [2.4 2.6])

%% 3
% eps/h^2 = h^2
h = eps^(1/4)

%% 4 
0.00853645/0.00110773
a = 0; b = 1;

%% 5
f = @(x) abs(sin(x)).*exp(-2*x/5);
x = linspace(2, 6, 601);
plot(x, f(x))
grid on

xmin = 2; xmax = 6;
integral(f, xmin, xmax, 'AbsTol', 1e-10, 'RelTol', 2e-8)

%% 6
f = @(t, y) (2/t)*y + t^2 * exp(t);
t0 = 2; tmax = 5;
y0 = 2; h = 0.01;

k1 = f(t0, y0)
k2 = f(t0 + (2/3)*h, y0 + (2/3)*h*k1)
y1 = y0 + (h/4)*(k1+3*k2)

%% 7
f = @(t, x) [x(2); x(2)*exp(-3*x(1)) - 2*t*x(1) + t^2];
t0 = 3; tmax = 4; h = 0.02; N = 50;
x0 = [2; 1]; y0 = x0;

[t, y] = math2089rk4(f, t0, tmax, N, y0);
[t, y]

opt = odeset('RelTol', 1e-7, 'AbsTol', 1e-10);
[t, y] = ode45(f, [t0 tmax], y0, opt);
[t, y]



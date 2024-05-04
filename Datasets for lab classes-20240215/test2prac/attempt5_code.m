%% 1
% e[k+1] = 0.6e[k]
e2 = 0.45;
e3 = 0.6*e2;
e4 = 0.6*e3;
e5 = 0.6*e4

e = 0.45;
m = 0;
while e >= 10^-11
    e = 0.6 * e
    m = m + 1;
end
m

%% 2
f = @(n) (n.^3).*log(n) - 112156
n = linspace(0, 100, 401);
plot(n, f(n))
grid on
fzero(f, [31 33])
f(32)

%% 4 

%% 5 
f = @(x) sin(2*x);
a = 0; b = 1; N = 16;
h = (b-a)/N;
x_eq = linspace(a, b, N+1);

w_simp = [1 2*ones(1, N-1) 1];
w_simp(2:2:N) = 4;
w_simp = (h/3) * w_simp;
Q_simp = sum(w_simp .* f(x_eq));

I = (1-cos(2))/2;
I - Q_simp

%% 6
f = @(t,x) [x(2); 2 - x(2)/t];
t0 = 1; tmax = 1.9;
y0 = [9; 10]
N = 3

[t, y] = math2089heun(f, t0, tmax, N, y0);
[t, y]

%% 7
f = @(t,x) [x(2); x(2)*exp(-3*x(1)) - 2*t*x(1) + t^2];
y0 = [2; 1];
h = 0.02; t0 = 3; tmax = 4;
N = 50;

[t, y] = math2089heun(f, t0, tmax, N, y0);
[t, y]

opt = odeset('RelTol', 1e-7, 'AbsTol', 1e-10)
[t, y] = ode45(f, [t0 tmax], y0, opt);
[t, y]
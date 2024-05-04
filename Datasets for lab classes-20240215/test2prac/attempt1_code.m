n = linspace(0,1,401);
f = @(n) (n.^3).*log(n) - 109208;

plot(n, f(n))
grid on
fzero(f,[30 34])


plot(f)

%%
f = @(x) 8/pi .* sqrt(x.*(1-x))
a = 0
b = 1
N = 9

[x, w] = math2089gauleg(N);
x_gl = (a+b)/2 + (b-a)/2 * x;
w_gl = (b-a)/2 *w;
Q_ql = sum(w_gl .* f(x_gl))

%%

f = @(x) abs(sin(x)).*exp(-2*x/3);
x = linspace(2, 4, 601)
plot(x, f(x))
grid on

2 + (0.1/2)*(2+2 + 4.5)

%%
f = @(t, x) [x(2); x(2) - 5*x(1)*t]

[t, y] = math2089euler(f,1,2,(2-1)/0.1,[3;0])

opt = odeset('RelTol', 1e-7,'AbsTol',1e-10);
[t, y] = ode45(f, [1,2], [3;0],opt)

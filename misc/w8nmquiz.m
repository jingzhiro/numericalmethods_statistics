f = @(t,x) [x(2); x(2).*exp(-x(1)) + 2.*t.*x(1) + t.^2];
h = 0.1;
t0 = 1; tmax = 2;
y0 = [0;1];

k1 = f(t0, y0);
k2 = f(t0 + 2/3*h, y0 + 2/3 *h*k1);
y1 = y0 + h/4 * (k1+3*k2)

t1 = t0 + h;
k1 = f(t1, y1);
k2 = f(t1 + 2/3*h, y1 + 2/3 *h*k1);
y2 = y1 + h/4*(k1+3*k2)

%%
f = @(t,x) [x(2); x(2).*exp(-x(1)) + 2.*t.*x(1) + t.^2];
h = 0.1;
t0 = 1; tmax = 2;
N = (tmax-t0)/h;
y0 = [0;1];

[t, y] = math2089rk4(f, t0, tmax,N,y0)

%%
f = @(t,x) [x(2); x(2)/t - x(1)/t^2]
t0 = 1; tmax = 4; ya = 2; yb = 16;
opt = odeset('RelTol', 1e-7,'AbsTol',1e-10);
format long

eta1 = 3.4491; % this is the guess
x0 = [ya; eta1]
[t, y] = ode45(f,[t0,tmax],x0,opt);
yb1 = y(end,1)

%% 
f = @(t,x) [x(2); (2*x(2))/t + x(1)/t^2];
t0 = 3; tmax = 4; h = 0.02; N = (tmax-t0)/h;
y0 = [2;1];

[t, y] = math2089heun(f, t0, tmax, N, y0)
y(t == 3.14)

%%
f = @(t,x) [x(2); (2*x(2))/t + x(1)/t^2];
t0 = 3; tmax = 4; h = 0.02; N = (tmax-t0)/h;
y0 = [2;1];

opt = odeset('RelTol', 1e-7, 'AbsTol', 1e-10);
[t, y] = ode45(f,[t0, tmax], y0, opt)


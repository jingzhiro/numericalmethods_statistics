f = @(x) sin(2*x)
a = 0;
b = 1;
N = 4;

[x, w] = math2089gauleg(N);

x_gl = (a+b)/2 + (b-a)/2 * x
w_gl = (b-a)/2 * w;

Q_gl = sum(w_gl .* f(x_gl))

I_f = (1-cos(2))/2
I_f - Q_gl

%% 

f = @(t,y) (2/t)*y + t^2 * exp(t)
h = 0.01; t0 = 1; tmax = 4;
y_i = 0;

t1 = t0 + h, y1 = y_i + h*f(t0, y_i)
t2 = t1 + h, y2 = y1 + h*f(t1,y1)

%% 
format long e 
f = @(x) sqrt(x-2);

a = 2;
b = 5;
N = 256; % Try N = 2,4,8,16,32,64,128, must be even for Simpson's
h = (b-a)/N;
x_eq = linspace(a, b, N+1);
 
w_simp = [1 2*ones(1,N-1) 1];
w_simp(2:2:N) = 4;
w_simp = (h/3) * w_simp;
Q_simp = sum(w_simp .* f(x_eq));

I_f = (2*sqrt(27))/3;

abs(I_f - Q_simp)

%%
y = @(x) sqrt(abs(x-4))
x = linspace(0,8,2000)
plot(x,y(x))




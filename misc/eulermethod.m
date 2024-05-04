f = @(t, y) 1/(1+t^2) - 2*y^2;
t0 = 0; tmax = 1; N = 10; h = (tmax - t0)/N;
y0 = 0;

t = [t0 : h : tmax];
y = zeros(1, N+1);
y(1) = y0;

for n = 1:N
    y(n+1) = y(n) + h*f(t(n),y(n));
end

[t; y]'
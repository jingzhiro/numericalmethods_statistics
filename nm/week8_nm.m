% MATH2089 NM Tutorial Week 8 - Matlab

%% QUESTION 1
%
%  First order initial value problems (IVPs)
%  Solve by math2089euler, math2089heun, math2089rk4
%  and MATLAB's built-in ode45

%  Specify integer N directly rather than define h and then calculate N
% DO NOT DO N = (tmax-t0)/h

%% (i)
ivp = "IVP (i)";
f = @(t,y) t.*exp(3*t) - 2*y;
t0 = 0; 
tmax = 1;
N = 2; % since h = 0.5
y0 = 0;
yexact = @(t) (t/5).*exp(3*t) - (1/25)*exp(3*t) + (1/25)*exp(-2*t);

%% (ii)
ivp = "IVP (ii)";
f = @(t,y) 1 + y./t;
t0 = 1; 
tmax = 2;
N = 4; % since h = 0.25
y0 = 2;
yexact = @(t) t.*log(t) + 2*t;

%% (iii)
ivp = "IVP (iii)";
f = @(t,y) 2*y./t + t.^2.*exp(t);
t0 = 1; 
tmax = 2;
N = 10; % since h = 0.1
y0 = 0;
yexact = @(t) t.^2 .* (exp(t) - exp(1));
        
%% solve
% [t, y] = math2089euler(f, t0, tmax, N, y0); method = "Euler's";
% [t, y] = math2089heun(f, t0, tmax, N, y0); method = "Heun's";
% [t, y] = math2089rk4(f, t0, tmax, N, y0); method = "RK4";

opt = odeset('RelTol', 1e-7, 'AbsTol', 1e-10);
[t, y] = ode45(f, [t0, tmax], y0, opt);
method = "ode45";
% ode45 is an adaptive method, notice how the stars are of varying gaps. 

% plot approximation against exact solution
figure(1)
tp = linspace(t0, tmax, 101);
plot(tp, yexact(tp), t, y, '*-')
legend('Exact solution', 'Approximation', 'Location', 'NorthWest')
xlabel('t')
ylabel('y(t)')
title(strcat(ivp, " using ", method, " method"))
grid on

% print error
err = yexact(t) - y;
fprintf('\n  n   t_n    y_n      Error\n');
for i = 1:length(t)
    fprintf('%3.i %6.2f %8.4f %12.4e\n', i-1, t(i), y(i), err(i));
end


%% QUESTION 2 
format long
%  Second order IVP
%     y'' = 2 y t + y', y(1) = 2, y'(1) = 1
%
% (a) Convert this second order ODE to a system of two first order ODEs
% Let x be a vector of [x1 = y; x2 = y']. 
% Therefore, we have x' = [x1' = y' = x2; x2' = y'' = 2*x1*t + x2].
f = @(t,x) [x(2); 2*x(1)*t + x(2)];
x0 = [2; 1] % starting column vector

% (b) Compute two steps of rk2 with step size h = 0.2
%
%          k1 = f(tn, yn)
%          k2 = f(tn + (2/3)h, yn + (2/3)h  k1)
%     y_(n+1) = yn + (h/4) (k1 + 3 k2)

% first step
t0 = 1;
h = 0.2;
y0 = x0; % rename to y0 to be consistent with notation for rk2

t1 = t0 + h;
k1 = f(t0, y0)
k2 = f(t0 + (2/3)*h, y0 + (2/3)*h * k1);
y1 = y0 + (h/4)*(k1 + 3*k2)

% second step
t2 = t1 + h;
k1 = f(t1, y1)
k2 = f(t1 + (2/3)*h, y1 + (2/3)*h * k1);
y2 = y1 + (h/4)*(k1 + 3*k2)

% estimate y(1.4) and y'(1.4)
y_end = y2(1)
dy_end = y2(2)

% (c) Implement your own math2089rk2.m by modifying math2089rk4.m
% Done in math2089rk2.m file

% (d) Use math2089rk2.m with step size h = 0.2 to estimate y(3) and y'(3)
t0 = 1;
tmax = 3;
N = 10; % since h = 0.2
[t, y] = math2089rk2(f, t0, tmax, N, y0);

y_end = y(end, 1)
y_end = y(end, 2)

%% QUESTION 3

% Chemical mixing problem from the lectures

% (a) Write this as an IVP in the standard form
q = 10; 
V = 2; 
alpha = 2.6; 
u1 = 3.2;      
u2 = 4.8;     
qoverV = q / V;  
r = @(x) alpha * x(1) * x(2);
f = @(t, x) [ qoverV * (u1 - x(1)) - r(x);
              qoverV * (u2 - x(2)) - r(x);
             -qoverV * x(3) + r(x)]; % column vector

% (b) Specify the time interval and initial condition
t0 = 0;
tmax = 1.2;     % convert seconds to minutes
x0 = [5; 3; 0]; % column vector

% (c) Solve by ode45
y0 = x0;
opt = odeset('RelTol', 1e-7, 'AbsTol', 1e-10);
[t, y] = ode45(f, [t0, tmax], y0, opt); % do not forget 'opt'
method = 'ode45';
N = length(t) - 1;

figure(2)
plot(t, y, '*-') % plot the 3 columns of y against t
legend('Chemical 1', 'Chemical 2', 'Product', 'Location', 'North')
title('Chemical mixing problem - ode45')
xlabel('Time t (mins)')
ylabel('Chemicals (moles/m^3)')
grid on

% (d) Solve by math2089euler.m
[t, y] = math2089euler(f, t0, tmax, N, y0);

figure(3)
plot(t, y, '*-') % plot the 3 columns of y against t
legend('Chemical 1', 'Chemical 2', 'Product', 'Location', 'North')
title("Chemical mixing problem - Euler's method")
xlabel('Time t (mins)')
ylabel('Chemicals (moles/m^3)')
grid on



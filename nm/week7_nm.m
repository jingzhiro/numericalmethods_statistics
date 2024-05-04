% MATH2089 NM Tutorial Week 7 - Matlab

%% QUESTION 1

% (a) smallest sensible h 
% need x+h > x, i.e., h > eps*|x|

% (b) define f(x) = e^(x^2/2) and its exact derivative f'(x)
f = @(x) exp(x.^2/2);
df = @(x) x.*exp(x.^2/2);

% (c) forward difference at x = 1 for h = 1,10^(-1),...,10^(-18)
h = 10.^(-[0:18])
fwd_diff = (f(1+h) - f(1))./h

% (d) absolute error
err = abs(fwd_diff - df(1))

% (e) log-log plot
figure(1)
loglog(h, err, 'b*')
xlabel('Finite difference stepsize h');
ylabel('Absolute error');
title("Absolute error in forward difference approximation of f'(1)");
xlim([1e-18 1]) 
grid on

% (f) optimize h 
% balance roundoff error with truncation error => eps/h = h
h = eps^(1/2)

% (g) Why is the error constant for h = 10^(-16), 10^(-17), 10^(-18)?
% For h < eps, x + h evaluates to x so their approximation is always 0
% The absolute error is then just the exact value of the derivative.

%% QUESTION 2

% (a) Integrate 1/x from 1 to 2. True solution is log(2).
f = @(x) 1./x;
a = 1; b = 2;
soln = log(2);

% (b)(c) Use trapezoidal rule, Simpson's rule, and Gauss-Legendre rule
% Download math2089gauleg.m from the coures Moodle page


Nvalues = [8, 16, 32, 64];
Ncount = 4;

E_trap = zeros(1,Ncount);
E_simp = zeros(1,Ncount);
E_gl   = zeros(1,Ncount);

fprintf(' N  trap       simp       gauleg\n');

for i = 1:Ncount
    N = Nvalues(i); 
    h = (b-a)/N;
    x_eq = linspace(a,b,N+1);
    
    w_trap = h * [1/2 ones(1, N-1) 1/2];
    Q_trap = sum(w_trap .* f(x_eq));
    E_trap(i) = abs(Q_trap - soln);
    
    w_simp = [1 2*ones(1,N-1) 1];   % 1, 2, 2, ..., 1
    w_simp(2:2:N) = 4;              % 1, 4, 2, 4, 2, 4, ... , 1
    w_simp = w_simp * (h/3);
    Q_simp = sum(w_simp .* f(x_eq));
    E_simp(i) = abs(Q_simp - soln);
    
    [x, w] = math2089gauleg(N);     % get points and weights for [-1, 1]
    x_gl = (a+b)/2 + (b-a)/2 * x;   % map points into [a,b]
    w_gl = (b-a)/2 * w;             % map weights into [a,b]
    Q_gl = sum(w_gl .* f(x_gl));
    E_gl(i) = abs(Q_gl - soln);

    fprintf('%2.d %10.3e %10.3e %10.3e\n', ...
        N, E_trap(i), E_simp(i), E_gl(i)); 
end

% (d) Compare the ratios of successive errors as N doubles
%     to see if the methods are converging at their theoretical rates
%
% Trapezoidal rule is order 2 if f is C^2[a,b]
% Simpson's rule is order 4 if f is C^4[a,b]
% Gauss-Legendre rule converges very fast (factorial) if f is C^(2N)[a,b]

% The function 1/x is smooth in the interval [1,2]
R_trap = E_trap(1:end-1) ./ E_trap(2:end) % ratio ~ 4 => order 2 
R_simp = E_simp(1:end-1) ./ E_simp(2:end) % ratio ~ 16 => order 4
R_gl = E_gl(1:end-1) ./ E_gl(2:end) 
% GL converges very fast to eps. The ratio is meaningless.
%% QUESTION 3

% 1) Integrate sin(x)^(1/3) from x = 0 to x = 2
% 2) Integrate |cos(x)| from x = 0 to x = pi
f1 = @(x) sin(x).^(1/3);
f2 = @(x) abs(cos(x));

% (a) Plot integrands
figure(2)
subplot(1,2,1)
t = linspace(0, 2, 101);
plot(t, f1(t))  
title('sin(x)^{1/3}')
grid on

subplot(1,2,2)
t = linspace(0, pi, 101);
plot(t, f2(t))
title('|cos(x)|')
grid on

% (b) Difficult features and fixes
% f1 has unbounded derivative at x = 0
% Fix: For small x, sin(x) ~ x, so the integrand behaves like x^(1/3).
%      Substituting x = y^3 yields a smooth integrand
%      3y^2sin(y^3)^(1/3)
f1b = @(y) 3*y.^2 .* sin(y.^(1/3)).^(1/3)
figure(3)
t = linspace (0, 2^(1/3), 101);
plot(t,f1b(t))

% f2 has derivative discontinuity at x=pi/2
% Fix: split into two integrals from 0 to pi/2 and from pi/2 to pi

%% (c) Adaptive quadrature
% Set 'AbsTol', 1e-10, 'RelTol', 2e-8 
% (Matlab default: 1e-10 and 1e-6)
% (Python default: 1.49e-8 and 1.49e-8)
format long
i1 = integral(f1, 0, 2, 'AbsTol', 1e-10, 'RelTol', 2e-8)
i2 = integral(f2, 0, pi, 'AbsTol', 1e-10, 'RelTol', 2e-8)

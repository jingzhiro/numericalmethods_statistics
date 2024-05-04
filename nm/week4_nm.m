% MATH2089 NM Tutorial Week 4 - Matlab

%% QUESTION 1

% (a) plot the data points
xdat = [0 0.5 1 1.5 2 2.5 3];         % create a row vector
ydat = [1.2 1.5 1.9 2.4 3.2 4.3 5.4]; % create a row vector

xdat = xdat(:) % convert to a column vector
ydat = ydat(:) % convert to a column vector

plot(xdat, ydat, 'r*')
title('Plot')
xlabel('x')
ylabel('y')


%% (b) line of best fit
A = xdat.^[0:1]


% METHOD 0: MATLAB backslash
u = A \ ydat
cond0 = cond(A)
r = norm(A*u - ydat)        % finds residual

% METHOD 1: normal equations
A1 = A'*A;
y1 = A'*ydat
% solve A1*u = y1
u1 = A1 \ y1
cond1 = cond(A1)
r = norm(A*u1 - ydat)
 

% METHOD 2: QR factorization
[Q, R] = qr(A)
y2 = Q'*ydat
u2 = R \ y2
cond2 = cond(R)
r = norm(A*u2 - ydat)

% all three solutions are the same, take METHOD 0
fprintf('Linear approximation  y(x) = %.6f + (%.6f)x\n', u(1), u(2));

% approximation at xp = 3.8
xp = 3.8
yp = u(1) + u(2)*xp

% plot
plot(xdat, u(1) + u(2)*xdat, "b-")


%% (c) quadratic of best fit
A = xdat.^[0:2]
u = A \ ydat
fprintf('Quadratic approximation  y(x) = %.6f + (%.6f)x + (%.6f)x^2\n', ...
         u(1), u(2), u(3));

% approximation at xp = 3.8
xp = 3.8
yp = u(1) + u(2)*xp + u(3)*xp^2
% plot
plot(xdat, u(1) + u(2)*xdat + u(3)*xdat.^2, "b-")

% X = linspace(min(xdat), max(xdat), 101)';
% plot(X, u(1) + u(2)*X + u(3)*X.^2, 'm--')


%% (d) exponential of best fit
A = xdat.^[0, 1]
ylog = log(ydat)
u = A \ ylog
lamb

fprintf('Exponential approximation  y(x) = %.6f exp(%.6f x)\n', lambda, mu);

% approximation at xp = 3.8

% plot


%% (e) add title and legend
title('Data, linear, quadratic and exponential approximations')
legend('Data', 'Linear approximation', 'Quadratic approximation', ...
       'Exponential approximation', 'Location', 'NorthWest')

   
%% QUESTION 2

% Given f(0) = 12.6, f(1) = 6.7, f(2) = 4.3, f(3) = 2.7

% (a) degree of polynomial
m = 4;
k = m - 1 % 2 datapoints are collected by one line, and so on...


% (b) data points
xdat = [0; 1; 2; 3]
ydat = [12.6; 6.7; 4.3; 2.7]

% (c) polynomial interpolation
A = xdat.^[0:k]
u = A \ ydat

fprintf('p(x) = %.6f + (%.6f)x + (%.6f)x^2 + (%.6f)x^3\n', ...
        u(1), u(2), u(3), u(4));

% (d) approximation of f(1.5)   
xp = 1.5

yp = u(1) + u(2)*xp + u(3)*xp^2 + u(4)*xp^3
% or
yp = (xp.^[0:k])*u

fprintf('p(%g) = %g\n', xp, yp);

% (e) plot
x = linspace(0, 3, 101)
y = u(1) + u(2)*x + u(3)*x.^2 + u(4)*x.^3
plot(x, y, 'b-')

figure(2)
plot(xdat, ydat, 'm*', x, y, 'b-')
title('Interpolating polynomial')
xlabel('x')
ylabel('y')
grid on
    
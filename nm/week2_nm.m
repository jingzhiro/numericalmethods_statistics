% MATH2089 NM Tutorial Week 2 - Matlab

%% QUESTION 1

% f(x) = e^{-x^2}
f = @(x) exp(-x.^2) % .^ for vector
w = linspace(-3, 3, 101) % 101 values between -3 and 3, 100 gaps

y = f(w)
plot(w, y, 'b*-')


%% QUESTION 2
a = 0.01; b = 2000; c = -0.001; x = -2.000000000005e5;
A1 = a*x^2 + b*x + c
A2 = x*(a*x + b) + c
A3 = c + b*x + a*x^2

% A1 = A2 = A3 mathematically, but they are all different.
% they are at the magnitude of 10^-8 which is far from eps
% catastrophic cancellation (subtracting nearly equal numbers)

%% QUESTION 3

% numerically preferable quadratic formula
% b > 0 => diamond, heart
% b < 0 => spade, club

a = 1;    b = 3;    c = 2;         % case (i)
%a = 0.01; b = 2000; c = -0.001;   % case (ii)

[r1, r2] = quadsolve(a,b,c);
d1 = a*r1^2 + b*r1 + c;
d2 = a*r2^2 + b*r2 + c;
fprintf('\nCoefficients: %g, %g, %g\n', a, b, c);
fprintf('       Roots: %g, %g\n', r1, r2);
fprintf('      Values: %.8e, %.8e\n', d1, d2);

% function [r1, r2] = quadsolve(a, b, c)
    % [r1, r2] = quadsolve(a, b, c)
    % Find the roots of the quadratic ax^2 + bx + c = 0
    % in a numerically stable way.
    % Input: assume a, b, c are real, and a is not zero
    % Output: the two roots
    % This is printed when entering help quadsolve.
 
% sqrtD = sqrt(b^2 - 4*a*c);

% if b >= 0
    % expr = - b - sqrtD;
    % r1 = (2*c) / expr;
    % r2 = expr / (2*a);
% else
    % expr = -b + sqrtD
    % r1 = expr / (2*a)
    % r2 = (2*c) / expr
% end

%% QUESTION 4

% vector norm
x = [5 ; -4 ; 0 ; 6]
n1 = norm(x, 1) % sum of abs
n2 = norm(x, 2) % sqrt of sum of squares
ninf = norm(x, Inf) % max abs

%% QUESTION 5

% matrix norm
A = [3 -4 2; 0 4 -5; 2 -2 3]
n1 = norm(A, 1)     % max abs col sum
ninf = norm(A, Inf) % max abs row sum
n2 = norm(A, 2)     % sqrt(max(eig(A'*A)) 
nf = norm(A, 'fro') % sqrt of sum of squares


%% QUESTION 6

A = [0 3 -2; -1 -4 2; 5 14 26]
B = [-11/8 -53/48 -1/48; 3/8 5/48 1/48; 1/16 5/32 1/32]

% (a) B is the inverse of A
A*B
check = norm(A*B - eye(3))

% (b) condition number measured in 1-norm
a1 = norm(A,1) 
b1 = norm(B,1) 
c1 = cond(A,1) 
c11 = a1*b1

% (c) condition number measured in inf-norm
ainf = norm(A,Inf) 
binf = norm(B,Inf)
cinf = cond(A,Inf) 
cinff = ainf*binf 

% (d) condition number measured in 2-norm
a2 = norm(A,2) 
b2 = norm(B,2)
c2 = cond(A,2)     
c22 = a2*b2
  

%% QUESTION 7

% (a) LU factorization
A = [0 3 -2; -1 -4 2; 5 14 26]
[L, U, P] = lu(A) % P*A = L*U

% (b) check LU factorization
E = P*A - L*U
check = norm(E)

% (c) solve linear system using LU factorization
%     Ax = b => PAx = Pb => LUx = Pb => Ly = Pb
% % (1) Solve Ly = Pb for y (forward sub)
% % (2) Solve Ux = y for x (back sub)
b = [1; 2; 3]

y = L \ (P*b)
x = U \ y

r = b - A*x 
check = norm(r) % checking that the resultant vector is zero magnitude

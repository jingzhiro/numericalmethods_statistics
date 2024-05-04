% MATH2089 NM Tutorial Week 3 - Matlab

%% QUESTION 1

A = [2 -1 2; -1 1 -1; 2 -1 3]
b = [2; 4; 1]

% (a) Is A symmetric?
norm(A - transpose(A)) / norm(A) % close to eps => symmetric

% (b) Does Cholesky factorization exist?
[R, k] = chol(A) % k is a flag, k = 0 => successful
% Therefore, Cholesky factorisation exists

% (c) Is A positive definite?
% A is positive definite because its Cholesky factorisation exists
% Cholesky factorisation exists => positive definite and symmetric
 
% (d) solve Ax = b
% R'Rx = b => solve R'y = b for y and then solve Rx = y for x
y = R'\b % solve R'y = b using forward sub
x = R\y % solve Rx = y using back sub
r = b - A*x
rnorm = norm(r)

%% QUESTION 2

% (a) load west0156 into sparse matrix A
clear all
load west0156.dat; 
A = sparse( west0156(:,1), west0156(:,2), west0156(:,3) );

% (b) issparse, size, nnz 
spA = issparse(A)
[mA,nA] = size(A)
nzA = nnz(A) % number of nonzero entries

% (c) full
F = full(A); % turns A into dense matrix format
spF = issparse(F)
[mF, nF] = size(F)
nzF = nnz(F)

% (d) spy plot of A
figure(1)
spy(A)
title('A from west0156')

% (e) Is A symmetric?
% No, A does not seem symmetric (spy plot may be used to rule out symmetry
% but can not be used to rule out symmetry)
symchkA = norm(A - A', 1)/norm(A, 1) % not close to eps => not symmetric
% 2-norm function does not exist for sparse matrices

% (f) submatrix A_ij for i = 146,...,156 and j = 1,...,5 (index from 1)
S = A(146:156, 1:5)
% creates a submatrix of column 146 to 156 and row 1 to 5
A(149, 2) % negative entry 
%% QUESTION 3

% (a) B = A' A
clear all
load west0156.dat;
A = sparse( west0156(:,1), west0156(:,2), west0156(:,3) );
B = A'*A;

% (b) spy plot of B
figure(2)
spy(B)
title("B = A'*A")

% (c) Is B symmetric?
symchkB = norm(B - B', 1)/norm(B, 1)
% Yes, returns 0 
 
% (d) nonzero elements of B 
nzB = nnz(B)
% B = A'*A has more nonzeros than A
% matrix multiplication causes 'fill-in'

% (e) Is B positive definite?
[R, k] = chol(B);
k % k = 138, k /= 0 => not positive definite
% Cholesky factorisation does not exist => 
% B is not positive definite

% (f) Is C positive definite?
[m, n] = size(B);
C = B + speye(m);
[R, k] = chol(C);
k % k = 0 => C is positive definite

% (g) symmetric reverse Cuthill McKee permutation
p = symrcm(C);
C2 = C(p,p);       % moves the nonzero entries closer to diagonal
[R2, k2] = chol(C2);
k2

% (h) spy plots of C, R, C2, R2
figure(3)
subplot(2, 2, 1)
spy(C)
title('C')

subplot(2, 2, 2)
spy(R)
title('R')

subplot(2,2,3)
spy(C2)
title('C2')

subplot(2,2,4)
spy(R2)
title('R2')

% (i) density of C, R, C2, R2
denC = nnz(C)/numel(C)
denR = nnz(R)/numel(R)
denC2 = nnz(C2)/numel(C2)
denR2 = nnz(R2)/numel(R2)
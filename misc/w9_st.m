X = hydrocarbon;
Y = oxygen;

lmOxygen = fitlm(X, Y)
t = 14.987/1.3391
n = length(hydrocarbon);
nu = n - 2

coefCI(lmOxygen, 0.01);


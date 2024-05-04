% MATH2089-2024-T1-W1
% Exercise-1
% Part-C

Year
Inflow
length(Year)
[Year Inflow]
[Year; Inflow]


% Exercise-2
% Part-A

histogram(Inflow)
xlabel('Inflow (cubic metres per second)')
ylabel('Frequency')
title('Annual Maximum Inflow')

% Part-B
mean(Inflow)
var(Inflow)
std(Inflow)
quantile(Inflow, [0 0.25 0.5 0.75 1])

% Part-C
figure
histogram(Inflow, 50, 'Normalization', 'pdf')
xlabel('Inflows')
ylabel('Density')
title('Density Histogram for Annual Maximum Inflow')

% Part-D
% If the number of classes is too few, information is lost, 
% however, if the classes are too many, a pattern is harder to determine.

% Part-E
edges = [0 500 1500 3000 6500];

figure
histogram(Inflow, edges, 'Normalization', 'pdf')
xlabel('Inflows')
ylabel('Density')
title('Density Histogram for Annual Maximum Inflow')

% Part-F
% Median

% Part-G
figure
histogram(Inflow, edges)
xlabel('Inflows')
ylabel('Frequency')
title('Frequency Histogram for Annual Maximum Inflow')

% Part-H
logInflow = log(Inflow)
figure
histogram(logInflow)
% add x, y, title

% Part-I
skewness(Inflow)
skewness(logInflow)

% The histogram in a) is highly positively skewed (or right skewed):
% the skeness is largely positive. After log-transformation, the histogram
% in h) is much more symmetrical as indicated by the skewness being -0.0105
% The histogram in h) also resembles the bell-shaped normal density
% as well. 

% Exercise 3!
% a)

% This extracts the ages of the US presidents only.
AgeUS = Age(strcmp(Country, 'US'));

% b) c)
figure(1)
histogram(AgeUS)
title('Frequency of US president ages')
xlabel('Age (years)')
ylabel('Frequency')

% Bell-shaped, slight skew to the right, average and median US presidential 
% age seems to be in the 50s, outlier at 78

% d)
edges = 42:3:75;
figure(2)
histogram(AgeUS, edges)
xlabel('Frequency')
ylabel('Age')

% e)
% It is easier to see a pattern in figure 2 as it is smoother.

% f)
AgeAU = Age(strcmp(Country, 'Aust'));

meanUS = mean(AgeUS); % 55.4783
stdUS = std(AgeUS); % 7.3325
varUS = var(AgeUS); % 53.7662

meanAU = mean(AgeAU); % 52.5484
stdAU = std(AgeAU); % 6.7074
varAU = var(AgeAU); % 44.9892

% The age of AU presidents is, on average, lower than the ages of US 
% presidents, with less deviation. 

% g) 
figure(3)
boxplot(Age, Country, 'Orientation', 'vertical')
title('Age when taking Office vs Country')
xlabel('Country')
ylabel('Age when taking Office')

% h) 
quantile(AgeUS, [0 0.25 0.5 0.75 1])
quantile(AgeAU, [0 0.25 0.5 0.75 1])

% a)
% i.
mean(Chest)
var(Chest)
std(Chest)
quantile(Chest, [0 0.25 0.5 0.75 1])

% ii.
mean(Chest >= 60)

% iii.
figure(1)
histogram(Chest, 6)
figure(2)
histogram(Chest, 12)

% I would consider around 12 classes

% b) 
% i.
boxplot(Chest, Airbag)
% Yes. There is an outlier at 97. 

% iii.





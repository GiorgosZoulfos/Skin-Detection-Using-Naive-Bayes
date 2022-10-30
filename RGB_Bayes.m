clear

%% training Bayes
load trainingSet.mat
[m1, ~] = size(skin);
[m2, ~] = size(nonSkin);

mSkin = estimateMeanValue(skin);
varSkin = estimateVariance(skin, mSkin);
covMatrixSkin = findCovarianceMatrix(skin, varSkin);

mNonSkin = estimateMeanValue(nonSkin);
varNonSkin = estimateVariance(nonSkin, mNonSkin);
covMatrixNonSkin = findCovarianceMatrix(nonSkin, varNonSkin);

c12 = 1;
c21 = 5;

p1 = m1 / (m1 + m2);
p2 = m2 / (m1 + m2);

r = (c12*p2) / (c21*p1);

%% testing Bayes
load testSet.mat
[m, ~] = size(testData);
pred = zeros(m,1);

for i=1:m
    
    x = zeros(3,1);
    x(1) = testData(i,1);
    x(2) = testData(i,2);
    x(3) = testData(i,3);
    
    probSkin = calculateProbability(x, mSkin, covMatrixSkin);
    probNonSkin = calculateProbability(x, mNonSkin, covMatrixNonSkin);
    
    if probSkin/probNonSkin > r
        pred(i) = 0;
    else
        pred(i) = 1;
    end
end
        
%% accuracy
sum = 0;
for i=1:m
    if pred(i) == testClass(i)
        sum = sum + 1;
    end
end

accuracy = (sum/m) * 100












function [covMatrix] = findCovarianceMatrix(A, vars)

    cov12 = cov(A(:,1), A(:,2));
    cov13 = cov(A(:,1), A(:,3));
    cov23 = cov(A(:,2), A(:,3));
    
    covMatrix = [vars(1) cov12(1,2) cov13(1,2); cov12(1,2) vars(2) cov23(1,2); cov13(1,2) cov23(1,2) vars(3)];
    
end
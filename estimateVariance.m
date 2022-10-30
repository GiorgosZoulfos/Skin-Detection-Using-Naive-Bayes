function [variance] = estimateVariance(A, mean)
    
    variance = zeros(3,1);
    [m, ~] = size(A);
    
    for i=1:m
        
        variance(1) = variance(1) + (A(i,1) - mean(1))^2;
        variance(2) = variance(2) + (A(i,2) - mean(2))^2;
        variance(3) = variance(3) + (A(i,3) - mean(3))^2;
        
    end
    
    for i=1:3
        variance(i) = sqrt((1/m)*variance(i));
    end
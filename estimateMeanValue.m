function [mean] = estimateMeanValue(A)
    
    mean = zeros(3,1);
    [m, ~] = size(A);
    
    mean(1) = sum(A(:,1))/m;
    mean(2) = sum(A(:,2))/m;
    mean(3) = sum(A(:,3))/m;
    
end
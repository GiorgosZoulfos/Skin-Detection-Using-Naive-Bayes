function [prob] = calculateProbability(x, mean, cov)
    
    x = cast(x, 'double');
    factor = sqrt(((2*pi)^3)*det(cov));
    coef = x-mean;
    ex = exp((-(coef'*(cov\coef)))/2);
    prob = ex / factor;
    
end
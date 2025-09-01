% Quadratic_Formula.m
function [x1,x2] = Quadratic_Formula(a,b,c)
    if a == 0
        error('a debe ser distinto de cero');
    end
    D = b.*b - 4.*a.*c;
    sqrtD = sqrt(D);
    x1 = (-b + sqrtD) ./ (2*a);
    x2 = (-b - sqrtD) ./ (2*a);
end

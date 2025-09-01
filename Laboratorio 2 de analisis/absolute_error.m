% absolute_error.m
function ea = absolute_error(x_true, x_approx)
    if nargin < 2
        error('Debes ingresar x_true y x_approx. Ejemplo: absolute_error(5, 4.8)');
    end
    ea = abs(x_true - x_approx);
end


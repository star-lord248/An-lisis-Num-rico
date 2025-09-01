% relative_error.m
function er = relative_error(x_true, x_approx)
    if nargin < 2
        error('Debes ingresar x_true y x_approx. Ejemplo: relative_error(5, 4.8)');
    end

    if x_true == 0
        er = NaN; % evita división por cero
    else
        er = abs(x_true - x_approx) / abs(x_true);
    end
end

function I = my_boole_function_martinez(fun, a, b, h)
    % Calcula la integral de fun de a a b usando la regla compuesta de Boole
    % Se asume que el intervalo se puede dividir en múltiplos de 4 subintervalos

    x = a:h:b;
    y = fun(x);
    n = length(x) - 1; % número de subintervalos

    if mod(n, 4) ~= 0
        error('El número de subintervalos debe ser múltiplo de 4');
    end

    I = 0;
    for i = 1:4:n
        % Boole's Rule: 2h/45 * (7*f0 + 32*f1 + 12*f2 + 32*f3 + 7*f4)
        I = I + (2*h/45) * ( ...
            7*y(i) + ...
            32*y(i+1) + ...
            12*y(i+2) + ...
            32*y(i+3) + ...
            7*y(i+4) );
    end
end
function I = my_trapezoidal_function_martinez(fun, a, b, h)
    % Calcula la integral de fun de a a b usando la regla compuesta de trapecios con paso h

    x = a:h:b;
    y = fun(x);

    % Suma los extremos y el doble de los intermedios
    I = h * (sum(y) - 0.5*y(1) - 0.5*y(end));
end
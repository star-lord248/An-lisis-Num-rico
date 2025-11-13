function I = my_simpson_function_martinez(fun, a, b, h)
    % Calcula la integral de fun de a a b usando la regla compuesta de Simpson con paso h

    x = a:h:b;
    y = fun(x);
    n = length(x) - 1; % Número de subintervalos

    if mod(n,2) ~= 0
        error('El número de subintervalos debe ser par para Simpson.');
    end

    I = 0;
    for i = 1:2:n
        I = I + (h/3)*(y(i) + 4*y(i+1) + y(i+2));
    end
end
function root = my_secant_function_name_lastname(fun, p0, p1, stop)
    % Método de la Secante
    % fun -> función f(x) (handle)
    % p0, p1 -> puntos iniciales
    % stop -> [max_iter, tol]

    tol = 1e-6;
    max_iter = 100;
    if length(stop) == 1
        max_iter = stop;
    elseif length(stop) == 2
        max_iter = stop(1);
        tol = stop(2);
    end

    fprintf('Iter\t p_k\t\t f(p_k)\t\t Error Relativo\n');

    for k = 1:max_iter
        f0 = fun(p0);
        f1 = fun(p1);

        % Fórmula de la secante
        p = p1 - f1*(p1 - p0)/(f1 - f0);

        % Error relativo
        err = abs((p - p1)/p);

        % Mostrar resultados
        fprintf('%d\t %.6f\t %.6e\t %.6e\n', k, p, fun(p), err);

        % Criterio de parada
        if err < tol
            break;
        end

        % Actualizar
        p0 = p1;
        p1 = p;
    end

    root = p;
end
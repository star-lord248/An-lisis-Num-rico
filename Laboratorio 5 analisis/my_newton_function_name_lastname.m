function root = my_newton_function_name_lastname(fun, p0, der, stop)
    % Newton-Raphson Method
    % fun  -> inline function (f(x))
    % p0   -> initial guess
    % der  -> inline function of derivative (f'(x))
    % stop -> stopping criteria (max iterations or tolerance)

    tol = 1e-6;   % tolerancia
    max_iter = 100; % número máximo de iteraciones
    if length(stop) == 1
        max_iter = stop;
    elseif length(stop) == 2
        tol = stop(2);
        max_iter = stop(1);
    end

    fprintf('Iter\t p_k\t\t f(p_k)\t\t f''(p_k)\t\t Error Relativo\n');

    for k = 1:max_iter
        f_val = fun(p0);
        df_val = der(p0);
        
        % Newton-Raphson update
        p = p0 - f_val/df_val;
        
        % Error relativo
        err = abs((p - p0)/p);
        
        % Imprimir resultados
        fprintf('%d\t %.6f\t %.6e\t %.6e\t %.6e\n', k, p, f_val, df_val, err);

        % Criterio de parada
        if err < tol
            break;
        end
        
        p0 = p;
    end
    root = p;
end
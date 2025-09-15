function [root, iterations, errors] = my_false_position_function_name_lastname(fun, a, b, max_iter, tol)
    % MY_FALSE_POSITION_FUNCTION_NAME_LASTNAME - Método de posición falsa para encontrar raíces
    %
    % Input:
    %   fun - función anónima @(x)
    %   a, b - extremos del intervalo [a, b] donde f(a)*f(b) < 0
    %   max_iter - número máximo de iteraciones
    %   tol - tolerancia (error relativo) para el criterio de parada
    %
    % Output:
    %   root - aproximación de la raíz
    %   iterations - número de iteraciones realizadas
    %   errors - vector con los errores relativos en cada iteración

    % Verificar que el intervalo sea válido
    if fun(a) * fun(b) >= 0
        error('El intervalo [a, b] no cumple f(a)*f(b) < 0');
    end
    
    % Inicializar variables
    iterations = 0;
    errors = zeros(max_iter, 1);
    root_prev = a;
    
    % Método de posición falsa
    while iterations < max_iter
        % Calcular punto por interpolación lineal (fórmula de regula falsi)
        c = (a * fun(b) - b * fun(a)) / (fun(b) - fun(a));
        fc = fun(c);
        
        % Calcular error relativo
        if iterations > 0
            errors(iterations + 1) = abs((c - root_prev) / c);
        end
        
        % Verificar criterio de convergencia
        if iterations > 0 && errors(iterations + 1) < tol
            break;
        end
        
        % Verificar si encontramos la raíz exacta
        if fc == 0
            root = c;
            break;
        end
        
        % Actualizar intervalo
        if fun(a) * fc < 0
            b = c;
        else
            a = c;
        end
        
        % Actualizar variables para siguiente iteración
        root_prev = c;
        iterations = iterations + 1;
        root = c;
    end
    
    % Recortar el vector de errores
    errors = errors(1:iterations);
    
    % Mostrar resultados
    fprintf('\n=== MÉTODO DE POSICIÓN FALSA ===\n');
    fprintf('Raíz aproximada: %.8f\n', root);
    fprintf('Iteraciones realizadas: %d\n', iterations);
    fprintf('Error final: %.2e\n', errors(end));
    fprintf('f(raíz) = %.2e\n', fun(root));
end
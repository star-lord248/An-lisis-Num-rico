function [root, iterations, errors] = my_bisection_function_name_lastname(fun, a, b, max_iter, tol)
    % MY_BISECTION_FUNCTION_NAME_LASTNAME - Encuentra la raíz de una función usando el método de bisección
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
    
    % Método de bisección
    while iterations < max_iter
        % Calcular punto medio
        c = (a + b) / 2;
        
        % Calcular error relativo
        if iterations > 0
            errors(iterations + 1) = abs((c - root_prev) / c);
        end
        
        % Verificar criterio de convergencia
        if iterations > 0 && errors(iterations + 1) < tol
            break;
        end
        
        % Actualizar intervalo
        if fun(c) == 0
            % Encontramos la raíz exacta
            root = c;
            break;
        elseif fun(a) * fun(c) < 0
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
    fprintf('\n=== MÉTODO DE BISECCIÓN ===\n');
    fprintf('Raíz aproximada: %.8f\n', root);
    fprintf('Iteraciones realizadas: %d\n', iterations);
    fprintf('Error final: %.2e\n', errors(end));
    fprintf('f(raíz) = %.2e\n', fun(root));
end
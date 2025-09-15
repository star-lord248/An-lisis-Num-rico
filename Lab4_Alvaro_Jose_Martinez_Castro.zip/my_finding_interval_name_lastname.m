function [a, b] = my_finding_interval_name_lastname(fun)
    % MY_FINDING_INTERVAL_NAME_LASTNAME - Encuentra un intervalo [a, b] donde f(a)*f(b) < 0
    % 
    % Input:
    %   fun - función anónima de la forma @(x) expresión
    %
    % Output:
    %   a, b - extremos del intervalo que contiene al menos una raíz
    
    % Parámetros configurables
    max_iter = 10;      % Número máximo de iteraciones
    step_size = 1;      % Tamaño del paso para buscar
    initial_point = 0;    % Punto inicial para comenzar la búsqueda
    
    a = initial_point;
    b = initial_point + step_size;
    iter = 0;
    
    % Buscar en dirección positiva
    while iter < max_iter
        if fun(a) * fun(b) < 0
            % Se encontró un intervalo válido
            return;
        end
        
        % Si no se encuentra, mover el intervalo
        a = b;
        b = b + step_size;
        iter = iter + 1;
    end
    
    % Si no se encontró en dirección positiva, buscar en dirección negativa
    a = initial_point;
    b = initial_point - step_size;
    iter = 0;
    
    while iter < max_iter
        if fun(a) * fun(b) < 0
            % Se encontró un intervalo válido
            return;
        end
        
        % Si no se encuentra, mover el intervalo
        a = b;
        b = b - step_size;
        iter = iter + 1;
    end
    
    % Si no se encuentra ningún intervalo, lanzar error
    error('No se pudo encontrar un intervalo [a, b] tal que f(a)*f(b) < 0 después de %d iteraciones', max_iter * 2);
end 
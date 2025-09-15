function P = my_visual_function_name_lastname(fun, a, b, Iter)
    % MY_VISUAL_FUNCTION_NAME_LASTNAME - Visualiza el comportamiento de los métodos
    % de bisección y posición falsa
    %
    % Input:
    %   fun - función anónima @(x)
    %   a, b - extremos del intervalo [a, b]
    %   Iter - número de iteraciones a visualizar
    %
    % Output:
    %   P - estructura con puntos de ambos métodos

    % Verificar que el intervalo sea válido
    if fun(a) * fun(b) >= 0
        error('El intervalo [a, b] no cumple f(a)*f(b) < 0');
    end
    
    % Inicializar variables
    a_bisec = a; b_bisec = b;
    a_false = a; b_false = b;
    
    % Almacenar puntos de cada método
    puntos_biseccion = zeros(Iter, 2);
    puntos_false_pos = zeros(Iter, 2);
    
    % Crear figura
    figure('Position', [100, 100, 1200, 800]);
    
    % Método de bisección
    subplot(2,1,1);
    hold on;
    title('Método de Bisección', 'FontSize', 14);
    xlabel('x', 'FontSize', 12);
    ylabel('f(x)', 'FontSize', 12);
    grid on;
    
    % Método de posición falsa
    subplot(2,1,2);
    hold on;
    title('Método de Posición Falsa', 'FontSize', 14);
    xlabel('x', 'FontSize', 12);
    ylabel('f(x)', 'FontSize', 12);
    grid on;
    
    % Realizar iteraciones y visualizar
    for i = 1:Iter
        % --- MÉTODO DE BISECCIÓN ---
        subplot(2,1,1);
        c_bisec = (a_bisec + b_bisec) / 2;
        puntos_biseccion(i, :) = [c_bisec, fun(c_bisec)];
        
        % Graficar función
        x_range = linspace(a, b, 1000);
        plot(x_range, fun(x_range), 'b-', 'LineWidth', 1.5);
        
        % Graficar puntos
        plot(puntos_biseccion(1:i, 1), puntos_biseccion(1:i, 2), 'ro', ...
            'MarkerSize', 8, 'MarkerFaceColor', 'r', 'LineWidth', 1.5);
        
        % Graficar líneas verticales
        plot([a_bisec, a_bisec], [0, fun(a_bisec)], 'g--', 'LineWidth', 1);
        plot([b_bisec, b_bisec], [0, fun(b_bisec)], 'g--', 'LineWidth', 1);
        plot([c_bisec, c_bisec], [0, fun(c_bisec)], 'm--', 'LineWidth', 2);
        
        % Actualizar intervalo
        if fun(a_bisec) * fun(c_bisec) < 0
            b_bisec = c_bisec;
        else
            a_bisec = c_bisec;
        end
        
        % --- MÉTODO DE POSICIÓN FALSA ---
        subplot(2,1,2);
        c_false = (a_false * fun(b_false) - b_false * fun(a_false)) / (fun(b_false) - fun(a_false));
        puntos_false_pos(i, :) = [c_false, fun(c_false)];
        
        % Graficar función
        plot(x_range, fun(x_range), 'b-', 'LineWidth', 1.5);
        
        % Graficar puntos
        plot(puntos_false_pos(1:i, 1), puntos_false_pos(1:i, 2), 'ro', ...
            'MarkerSize', 8, 'MarkerFaceColor', 'r', 'LineWidth', 1.5);
        
        % Graficar líneas de interpolación
        plot([a_false, b_false], [fun(a_false), fun(b_false)], 'g--', 'LineWidth', 1);
        plot([c_false, c_false], [0, fun(c_false)], 'm--', 'LineWidth', 2);
        
        % Actualizar intervalo
        if fun(a_false) * fun(c_false) < 0
            b_false = c_false;
        else
            a_false = c_false;
        end
        
        % Añadir leyendas y títulos
        subplot(2,1,1);
        legend('f(x)', 'Aproximaciones', 'Límites intervalo', 'Punto medio', 'Location', 'best');
        title(sprintf('Bisección - Iteración %d/%d', i, Iter));
        
        subplot(2,1,2);
        legend('f(x)', 'Aproximaciones', 'Línea interpolación', 'Raíz aproximada', 'Location', 'best');
        title(sprintf('Posición Falsa - Iteración %d/%d', i, Iter));
        
        % Pausa para visualización animada
        pause(1);
        
        % Limpiar subplots para la siguiente iteración (excepto la última)
        if i < Iter
            subplot(2,1,1); cla;
            subplot(2,1,2); cla;
        end
    end
    
    % Añadir línea horizontal en y=0 a ambos subplots
    subplot(2,1,1);
    plot([a, b], [0, 0], 'k-', 'LineWidth', 1);
    
    subplot(2,1,2);
    plot([a, b], [0, 0], 'k-', 'LineWidth', 1);
    
    % Devolver puntos en estructura
    P.biseccion = puntos_biseccion;
    P.false_pos = puntos_false_pos;
    P.final_bisec = c_bisec;
    P.final_false = c_false;
    
    fprintf('\n=== RESULTADOS FINALES ===\n');
    fprintf('Bisección:   raíz ≈ %.8f, f(raíz) = %.2e\n', c_bisec, fun(c_bisec));
    fprintf('Posición Falsa: raíz ≈ %.8f, f(raíz) = %.2e\n', c_false, fun(c_false));
end
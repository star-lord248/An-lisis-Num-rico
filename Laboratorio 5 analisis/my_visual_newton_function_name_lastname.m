function my_visual_newton_function_name_lastname(fun, p0, der, stop)
    % Visualización del método de Newton-Raphson
    % fun -> función f(x) (handle)
    % p0  -> valor inicial
    % der -> derivada f'(x) (handle)
    % stop -> número de iteraciones

    p0 = double(real(p0));  % asegurar número real

    % Crear un rango para graficar la función
    x_vals = linspace(p0-10, p0+10, 400);
    y_vals = arrayfun(fun, x_vals);

    figure;
    plot(x_vals, y_vals, 'b-', 'LineWidth', 1.5); hold on;
    plot(x_vals, zeros(size(x_vals)), 'k--'); % eje x
    xlabel('x'); ylabel('f(x)');
    title('Visualización del método de Newton-Raphson');

    % Iteraciones
    for k = 1:stop
        f_val = fun(p0);
        df_val = der(p0);

        % Siguiente aproximación
        p = p0 - f_val/df_val;

        % Recta tangente en p0 (ahora sin warnings)
        px = double(real(p0));
        tangent_x = linspace(px-2, px+2, 100);
        tangent_y = f_val + df_val*(tangent_x - px);
        plot(tangent_x, tangent_y, 'r--');

        % Graficar el punto y la conexión al eje x
        plot(px, f_val, 'ko', 'MarkerFaceColor', 'g');
        plot([px p], [f_val 0], 'm:');

        % Actualizar
        p0 = double(real(p));
    end

    hold off;
end
function my_visual_secant_function_name_lastname(fun, p0, p1, stop)
    % Visualización del método de la Secante
    % fun -> función f(x) (handle)
    % p0, p1 -> puntos iniciales
    % stop -> número de iteraciones

    p0 = double(real(p0));
    p1 = double(real(p1));

    % Crear un rango para graficar la función
    x_vals = linspace(min([p0 p1])-5, max([p0 p1])+5, 400);
    y_vals = arrayfun(fun, x_vals);

    figure;
    plot(x_vals, y_vals, 'b-', 'LineWidth', 1.5); hold on;
    plot(x_vals, zeros(size(x_vals)), 'k--'); % eje x
    xlabel('x'); ylabel('f(x)');
    title('Visualización del método de la Secante');

    for k = 1:stop
        f0 = fun(p0);
        f1 = fun(p1);

        % Fórmula de la secante
        p = p1 - f1*(p1 - p0)/(f1 - f0);

        % Graficar la secante entre (p0,f0) y (p1,f1)
        plot([p0 p1], [f0 f1], 'r--');
        plot(p1, f1, 'ko', 'MarkerFaceColor', 'g'); % punto actual
        plot(p, 0, 'ms', 'MarkerFaceColor', 'm');   % aproximación sobre el eje x

        % Actualizar
        p0 = p1;
        p1 = p;

        % Si converge suficientemente, salir
        if abs(f1) < 1e-6
            break;
        end
    end

    hold off;
end
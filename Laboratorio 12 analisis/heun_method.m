function [t_values, y_values] = heun_method(f, t0, y0, h, num_steps)
    t_values = zeros(1, num_steps+1);
    y_values = zeros(1, num_steps+1);
    t_values(1) = t0;
    y_values(1) = y0;
    for k = 1:num_steps
        % Predictor (Euler)
        y_predictor = y_values(k) + h * f(t_values(k), y_values(k));
        t_next = t_values(k) + h;
        % Corrector (Heun)
        y_values(k+1) = y_values(k) + (h/2)*(f(t_values(k), y_values(k)) + f(t_next, y_predictor));
        t_values(k+1) = t_next;
    end
end

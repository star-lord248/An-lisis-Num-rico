function [t_values, y_values] = euler_method(f, t0, y0, h, num_steps)
    t_values = zeros(1, num_steps+1);
    y_values = zeros(1, num_steps+1);
    t_values(1) = t0;
    y_values(1) = y0;
    for k = 1:num_steps
        t_values(k+1) = t_values(k) + h;
        y_values(k+1) = y_values(k) + h * f(t_values(k), y_values(k));
    end
end

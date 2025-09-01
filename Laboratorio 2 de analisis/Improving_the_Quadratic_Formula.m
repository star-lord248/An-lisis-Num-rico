% ===== File: Improving_the_Quadratic_Formula.m =====
function [x1,x2] = Improving_the_Quadratic_Formula(a,b,c)
% Calcula las raíces de a x^2 + b x + c = 0 de forma numéricamente estable.
% Usa las fórmulas racionalizadas (2) según el signo de b para evitar cancelación.
%
% Entradas: a,b,c escalares (a ~= 0). Supuesto del punto: b^2 - 4ac > 0.
% Salidas:  x1, x2 (raíces)

    if a == 0
        error('a debe ser distinto de cero');
    end

    D = b.*b - 4.*a.*c;         % discriminante
    sqrtD = sqrt(D);

    if b > 0
        % Si b > 0: x1 con (2) y x2 con (1)
        x1 = (-2*c) ./ (b + sqrtD);    % fórmula (2)
        x2 = (-b - sqrtD) ./ (2*a);    % fórmula (1)
    else
        % Si b <= 0: x1 con (1) y x2 con (2)
        x1 = (-b + sqrtD) ./ (2*a);    % fórmula (1)
        x2 = (-2*c) ./ (b - sqrtD);    % fórmula (2)
    end
end

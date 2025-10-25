function [P] = my_LagrangePolynomial_alvaro_martinez(X, Y)
    % Esta función calcula el polinomio de interpolación de Lagrange
    % X: vector de puntos x
    % Y: vector de puntos y
    % P: vector de coeficientes del polinomio
    
    n = length(X);         % número de puntos
    syms x;                % variable simbólica
    P = 0;                 % inicializa el polinomio
    
    for k = 1:n
        Lk = 1;            % inicializa Lk(x)
        for j = 1:n
            if j ~= k
                Lk = Lk * (x - X(j)) / (X(k) - X(j));
            end
        end
        P = P + Y(k) * Lk; % suma y_k * L_k(x)
    end
    
    P = expand(P);         % simplifica el polinomio
end

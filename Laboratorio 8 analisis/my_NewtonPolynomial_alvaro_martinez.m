function [P] = my_NewtonPolynomial_alvaro_martinez(X, Y)
    % Esta función calcula el polinomio de interpolación de Newton
    % usando diferencias divididas.
    % X: vector de puntos x
    % Y: vector de puntos y
    % P: polinomio simbólico P(x)

    n = length(X);
    D = zeros(n, n);   % tabla de diferencias divididas
    D(:,1) = Y(:);     % primera columna: valores de Y

    % Cálculo de diferencias divididas
    for j = 2:n
        for i = 1:(n - j + 1)
            D(i,j) = (D(i+1,j-1) - D(i,j-1)) / (X(i+j-1) - X(i));
        end
    end

    % Coeficientes a_k
    a = D(1, :);

    % Construcción del polinomio simbólico
    syms x
    P = a(1);
    term = 1;
    for k = 2:n
        term = term * (x - X(k-1));
        P = P + a(k) * term;
    end

    P = expand(P); % simplifica el polinomio
end

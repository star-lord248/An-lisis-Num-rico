function D = binary_to_decimal(S, M, E)
    % Convierte un número en formato IEEE 754 half (16 bits) a decimal
    % S: bit de signo (0 o 1)
    % E: vector de 5 bits de exponente
    % M: vector de 10 bits de mantisa

    % Sesgo (bias) para half precision
    bias = 15;

    % Convertir exponente binario a decimal
    exp_val = bi2de(E, 'left-msb');

    % Convertir mantisa binaria a decimal
    mant_val = 0;
    for i = 1:length(M)
        mant_val = mant_val + M(i) * 2^(-i);
    end

    % Caso normalizado
    if exp_val > 0 && exp_val < 31
        D = (-1)^S * (1 + mant_val) * 2^(exp_val - bias);

    % Caso subnormal (exp = 0)
    elseif exp_val == 0
        D = (-1)^S * (0 + mant_val) * 2^(1 - bias);

    % Caso infinito o NaN
    elseif exp_val == 31
        if mant_val == 0
            D = (-1)^S * Inf;
        else
            D = NaN;
        end
    end
end

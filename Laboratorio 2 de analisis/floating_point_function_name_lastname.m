% floating_point_function_name_lastname.m
function [S, M, E] = floating_point_function_name_lastname(N)
    % Representación en coma flotante de 16 bits:
    % 1 bit Signo, 5 bits Exponente, 10 bits Mantisa

    % ----- Bit de signo -----
    if N < 0
        S = 1;
        N = abs(N);
    else
        S = 0;
    end

    % ----- Normalizar número -----
    % Se convierte a binario normalizado: N = 1.xxxxx * 2^exp
    exp = floor(log2(N));
    mantissa_val = N / (2^exp) - 1; % parte fraccionaria

    % ----- Exponente con bias -----
    bias = 15;             % porque 5 bits -> 2^(5-1)-1 = 15
    E = exp + bias;        % exponente sesgado
    E_bin = dec2bin(E, 5); % en binario con 5 bits

    % ----- Mantisa -----
    M_bin = '';
    frac = mantissa_val;
    for i = 1:10   % 10 bits de mantisa
        frac = frac * 2;
        if frac >= 1
            M_bin = strcat(M_bin, '1');
            frac = frac - 1;
        else
            M_bin = strcat(M_bin, '0');
        end
    end
    M = M_bin;

    % ----- Mostrar representación final -----
    fprintf('Floating-point (16 bits): %d %s %s\n', S, E_bin, M);
end

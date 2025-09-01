function binary_value = My_binary_function(decimal, precision)
    % Convierte un número decimal (entero o fraccionario) a binario
    % Entrada:
    %   decimal   -> número en base 10 (puede ser entero o fracción)
    %   precision -> (opcional) número de bits para la parte fraccionaria
    % Salida:
    %   binary_value -> string con el número en binario

    % Si no se pasa ningún argumento, usar un valor por defecto
    if nargin < 1
        decimal = 0;   % valor por defecto
    end
    if nargin < 2
        precision = 0; % valor por defecto
    end

    % Parte entera
    int_part = floor(decimal);
    frac_part = decimal - int_part;

    % Convierte la parte entera con dec2bin
    int_bin = dec2bin(int_part);

    if precision == 0 || frac_part == 0
        % Si no hay parte fraccionaria o no se pidió precisión
        binary_value = int_bin;
    else
        % Convierte la parte fraccionaria
        frac_bin = '';
        for i = 1:precision
            frac_part = frac_part * 2;
            if frac_part >= 1
                frac_bin = [frac_bin '1'];
                frac_part = frac_part - 1;
            else
                frac_bin = [frac_bin '0'];
            end
        end
        binary_value = [int_bin '.' frac_bin];
    end
end
function decimal = My_decimal_function(binary_str)
    % Convierte un número binario (string) a decimal
    
    % Verificamos si tiene parte fraccionaria
    parts = strsplit(binary_str, '.');
    int_part = parts{1};
    decimal = 0;
    
    % --- Parte entera ---
    for i = 1:length(int_part)
        if int_part(end-i+1) == '1'
            decimal = decimal + 2^(i-1);
        end
    end
    
    % --- Parte fraccionaria ---
    if length(parts) == 2
        frac_part = parts{2};
        for i = 1:length(frac_part)
            if frac_part(i) == '1'
                decimal = decimal + 2^(-i);
            end
        end
    end
end

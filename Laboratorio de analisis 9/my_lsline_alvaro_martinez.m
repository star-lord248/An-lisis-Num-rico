function [A, B, y_hat, MSE, MAE] = my_lsline_alvaro_martinez(X, Y)
% MY_LSLINE_ALVARO_MARTINEZ  Ajusta una recta y = A*x + B por mínimos cuadrados
% Entradas:
%   X : vector columna de valores de x
%   Y : vector columna de valores de y
% Salidas:
%   A : pendiente
%   B : intercepto
%   y_hat : valores ajustados
%   MSE : error cuadrático medio
%   MAE : error absoluto medio

% Asegurar vectores columna
X = X(:);
Y = Y(:);
n = length(X);

% Matriz del modelo [x 1]
M = [X ones(n,1)];

% Coeficientes [A; B] = (M'M)^(-1) M'Y
coeff = (M' * M) \ (M' * Y);
A = coeff(1);
B = coeff(2);

% Valores ajustados
y_hat = M * coeff;

% Errores
MSE = mean((Y - y_hat).^2);
MAE = mean(abs(Y - y_hat));
end

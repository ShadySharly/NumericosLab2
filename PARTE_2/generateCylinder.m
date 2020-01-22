function [X] = generateCylinder(Te, n)
R = 1; % Radio inicial del cilindro
A = zeros(n);
b = zeros(n, 1);
particion = R / n; % Particiones iniciales
%indices iniciales de la matriz
A(1, 1) = -1;
A(1, 2) = 1;
b(1, 1) = -1;
posicion1 = 1;
posicion2 = 2;
posicion3 = 3;
%resultado de la matriz b
resultado = 50 * (particion ^ 2);

for i = 2: n
    
    if posicion3 <= n
        A(i, posicion1) = i - 1;
        A(i, posicion2) = -(2 * (i - 1) + 1);
        A(i, posicion3) = i ;
        b(i, 1) = ( -(i - 1) * resultado) ;        
    else
        A(i, posicion1)= i - 1;
        A(i, posicion2)= -(2 * (i - 1) + 1);
        b(i, 1) = (resultado * (i - 1) - i * Te);
    end
   
    posicion1 = posicion1 + 1;
    posicion2 = posicion2 + 1;
    posicion3 = posicion3 + 1;
end

X = linsolve(A, b);

end

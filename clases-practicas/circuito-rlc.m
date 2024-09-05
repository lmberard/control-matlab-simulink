%En este ejercicio se plantea el calculo del Jacobiano

%Creacion de las matrices de estado a partir de las ecuaciones del modelo:
%Defino vc(t)= x1 e il(t)=x2
x = sym(['x1'; 'x2']);
%Defino u(t)=v
v = sym('v');
%Defino ecuaciones:
syms R L C
f = [(-1/(R*C))*x(1)+(1/C)*x(2);(-1/L)*x(1)+(1/L)*v];
g = [(1/R)*x(1)];

A = jacobian(f,x);
B = jacobian(f,v);
C = jacobian(g,x);
D = jacobian(g,v);


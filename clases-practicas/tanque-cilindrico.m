clear all; clc;

% Creacion de variables simbolicas para variables de estado y entrada de
% control
h=sym('h','real');
u=sym('u','real');

%Ecuaciones del Tanque cilindrico
a=1;               %reestriccion de salida [cm^2]
d=50;              %diametro del tanque [cm]
Area=pi*(d/2)^2;   %area del tanque [cm^2]
g=980;             %gravedad [cm/seg^2]
f=[(-a/Area)*sqrt(2*g*h) + (1/Area)*u];

% Calculo del jacobiano para el armado de la representacion en espacio de
% estados
A=jacobian(f,h);
B=jacobian(f,u);

% Definicion de las condiciones de equilibrio
q_e=100;                 %caudal de equilibrio [cm^3/seg]
h_e=(q_e/a)^2/(2*g);     %altura de equilibrio [cm]

% Reemplazo de las variables simbolicas con sus valores de equilibrio
A=subs(A,'h',num2str(h_e));
A=subs(A,'u',num2str(q_e));
B=subs(B,'h',num2str(h_e));
B=subs(B,'u',num2str(q_e));

% Conversion a formato "double" para que los elementos de la matriz
% aparezcan como valores decimales en lugar de fracciones largas
A=double(A)
B=double(B)

% Definicion de las matrices C y D para la salida
C=[1];
D=[0];

% Construccion de la funcion de transferencia en base a las matrices A, B,
% C y D. 
P=zpk(ss(A,B,C,D))
[zz,pp,kk]=zpkdata(P,'v');

% Ubicacion de polos y ceros de la transferencia
figure,pzmap(P);

% Respuesta de la transferencia de la planta ante un escalon de amplitud
% Qi, diferencial respecto del equilibrio
Qi=0.05;
figure,step(Qi*P);

% Respuesta de la transferencia de la planta ante un impulso de amplitud
% Qi, diferencial respecto del equilibrio
figure,impulse(Qi*P);

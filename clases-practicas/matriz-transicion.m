%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%EJEMPLO 3: Calculo de la matriz de transicion STM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
close all;
clear all;

%Defino espacio de estados
A=[0 1;-8 -6];
B=[0;1];
C=[1 0];
D=0;
disp('Matriz A');disp(A);            %muestro matriz A
disp('Matriz B');disp(B);            %muestro matriz B
disp('Matriz C');disp(C);            %muestro matriz C
disp('Matriz D');disp(D);            %muestro matriz D

%Calculo la STM a partir de la antitransformada de (sI-A)^-1
%Calculo (sI-A)^-1
s = sym('s');
I=eye(2);              %matriz identidad
Fis=inv(s*I-A);        %calculo (sI-A)^-1
Fit_1=ilaplace(Fis);   %antitransformo
disp('STM calculada por antitransformada de Laplace');         %muestro la STM en t
pretty(Fit_1);

%Calculo la STM a partir Cayley-Hamilton
syms lambda t alfa0 alfa1
R=-lambda+eig(lambda*I-A);        %Obtengo los valores de los lambda a partir del polinomio caracteristico de |lambda*I-A|
eqns = [alfa0+R(1)*alfa1==exp(-R(1)*t),alfa0+R(2)*alfa1==exp(-R(2)*t)];
S=solve(eqns,[alfa0 alfa1]);
Fit_2=alfa0*I-alfa1*A;
Fit_2=subs(Fit_2,alfa0,S.alfa0);
Fit_2=subs(Fit_2,alfa1,S.alfa1);
disp('STM calculada por Cayley-Hamilton');                     %muestro la STM en t
pretty(Fit_2);

%Calculo la STM con matriz exponencial
Fit_3=expm(A*t);
disp('STM calculada por con matriz exponencial');              %muestro la STM en t
pretty(Fit_3);
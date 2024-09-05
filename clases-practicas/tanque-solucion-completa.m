%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%EJEMPLO 4: Calculo de la solucion completa
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
close all;
clear all;

%Defino espacio de estados
A=[-2 1 0;0 0 1;0 -6 -1];
B=[1;0;0];
C=[1 0 0];
D=0;
x0=[1;1;0];                          %defino CI
disp('Matriz A');disp(A);            %muestro matriz A
disp('Matriz B');disp(B);            %muestro matriz B
disp('Matriz C');disp(C);            %muestro matriz C
disp('Matriz D');disp(D);            %muestro matriz D

%Calculo la STM a partir de la antitransformada de (sI-A)^-1
%Calculo (sI-A)^-1
s = sym('s');
I=eye(3);              %matriz identidad
Fis=inv(s*I-A);        %calculo (sI-A)^-1
Fit=ilaplace(Fis);     %antitransformo
syms t tau
Fit_tau=subs(Fit,t,t-tau);
u=1;                                     %defino entrada
xt=Fit*x0+int(Fit_tau*B*u,tau,0,t);      %armo solucion completa temporal
xt=simplify(xt);
yt=C*xt;
disp('Respuesta completa y(t) a partir de Fi(t)')
pretty(yt)

Us=1/s;                                  %transformada de la entrada
Ys=C*Fis*x0+C*Fis*B*Us+D*Us;             %armo solucion completa con laplace  
ytt=ilaplace(Ys);
disp('Respuesta completa y(t) a partir de Fi(s)')
pretty(ytt)
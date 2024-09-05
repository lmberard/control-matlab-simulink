%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%EJEMPLO 1: Conversion de funcion de transferencia a espacio de estados
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
close all;
clear all;

disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('EJEMPLO 1: Conversion de funcion de transferencia a espacio de estado');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

%Defino la funcion de transferencia
numT1=[1 7 2];        %numerador de T1
denT1=[1 9 26 24];    %denominador de T1
disp('Funcion de tarnsferencia');
T1=tf(numT1,denT1)       %defino funcion de transferencia

%Convierto a espacio de estados
[A1,B1,C1,D1]=tf2ss(numT1,denT1); 
disp('Matriz A');disp(A1);            %muestro matriz A
disp('Matriz B');disp(B1);            %muestro matriz B
disp('Matriz C');disp(C1);            %muestro matriz C
disp('Matriz D');disp(D1);            %muestro matriz D

%Expreso el espacio de estados a su forma canonica controlable
P=[0 0 1;0 1 0;1 0 0];
A1fcc= inv(P)*A1*P;
B1fcc= inv(P)*B1;
C1fcc= C1*P;
disp('Matriz A en FCC');disp(A1fcc);            %muestro matriz A
disp('Matriz B en FCC');disp(B1fcc);            %muestro matriz B
disp('Matriz C en FCC');disp(C1fcc);            %muestro matriz C
disp('Matriz D en FCC');disp(D1);               %muestro matriz D

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%EJEMPLO 2: Conversion de espacio de estados a funcion de transferencia
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp('EJEMPLO 2: Conversion de espacio de estados a funcion de transferencia');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

%Defino espacio de estados
A2=[8 -4 1;-3 2 0;5 7 -9];
B2=[-4;-3;4];
C2=[2 8 -3];
D2=0;
disp('Matriz A');disp(A2);            %muestro matriz A
disp('Matriz B');disp(B2);            %muestro matriz B
disp('Matriz C');disp(C2);            %muestro matriz C
disp('Matriz D');disp(D2);            %muestro matriz D

%Convierto a funcion transferencia con ss2tf: 
[numT2,denT2]=ss2tf(A2,B2,C2,D2);
disp('Con SS2TF')
T2_1=tf(numT2,denT2)       %armo funcion de transferencia

%Convierto a funcion transferencia con C((sI-A)^-1)B + D2
s = sym('s');
I=eye(3);         %matriz identidad
disp('haciendo C((sI-A)^-1)B+D2')
T2_2=simplify((C2*inv(s*I-A2)*B2)+D2);
pretty(T2_2)

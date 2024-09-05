%Problema no lineal 2.31 del FranklinPowell
% u1 i1 u1  i2 u2 i3 v3 son lospuntos de equilibri sobre los que se toma la
% linealizacion
clear all;clc;close all
u1=1; i1=0 ; v1=0;
%u1=1; i1=-1+sqrt(3) ; v1=-1+sqrt(3);
%u1=1; i1=-1-sqrt(3) ; v1=-1-sqrt(3);

syms i v u;
f1 = -i + v;
f2 = -i + (u-v)*(u-v-1)*(u-v-4);
A = jacobian( [f1 ; f2], [ i v]);

B = jacobian( [f1 ; f2], [ u]);
g1 = i;
g2= v ;
C = jacobian( [g1 ; g2], [ i v]);
D = jacobian( [g1 ; g2], [ u ]);
u=u1; 
i=i1;
v=v1;
A = eval (A);
B = eval (B);
C = eval (C);
D = eval (D);
sys = ss(A,B,C,D);
step(sys,1);
A
B
C 
D
[num,den]=ss2tf(A,B,C,D)
num
den
%%
%s=tf('s')
%sys1=zpk(num,den,1)
%sys1=tf(num,den)





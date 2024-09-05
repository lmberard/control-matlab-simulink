%Problema bolita suspendida P3
% linealizacion
clear all;clc;close all
R=23.2 ; L=0.508 ; I0=1.06 ;
m=1.75 ;X0=4.36E-3 ; k= 2.9E-4 ; g=9.8;
w1=24.592; 
x1=4.36E-3 ; 
i1=I0;
v1=0;

syms i x v w;
f1 = -i*R/L + w*1/L;
f2 = v;
f3= -(k/m) *((i)^2/(x)^2)+g ;
A = jacobian( [f1 ; f2 ;f3], [i x v]);
B = jacobian( [f1 ; f2 ;f3], [ w]);
g1 = x;
C = jacobian( [g1], [ x]);
D = jacobian( [g1], [ w ]);

w=w1;
i=i1; 
x=x1;
v=v1;
A = eval (A);
B = eval (B);
C = eval (C);
D = eval (D);
A
B
C 
D
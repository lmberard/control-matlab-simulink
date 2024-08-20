clear all;clc

Lo=0.196;
a=0.01;
m=1;
io=1;
g=9.8;

syms x1 x2 s i
y=x1;
u=i;

f=[x2;  -(Lo*a/2*m)*(i/(a+y))^2]

x=[x1;x2];

Jx1=jacobian(f,x1)
Ji=jacobian(f,i)

subs(Jx1,{i,x1},{1,0})
subs(Ji,{i,x1},{1,0})

Jx=jacobian(f,x)
Ju=jacobian(f,u)
A=subs(Jx,{i,x1},{1,0})
B=subs(Ju,{i,x1},{1,0})

A=double(A)
B=double(B)
C=[1 0]

clear s;
s=tf('s');

Pss=ss(A,B,C,0);








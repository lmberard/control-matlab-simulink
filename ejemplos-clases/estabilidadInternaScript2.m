% Estabilidad Interna 
% Alejandro S. Ghersin - 2019/2020
%
clear all;clc;
s=tf('s') % DEFINO LA VARIABLE 's' DEL TOOLBOX DE CONTROL.

% NOTAR QUE LA FUNCIÓN MINREAL, LLEVA A CABO UNA CANCELACION
% NUMERICA DE POLOS Y CEROS. EN OCASIONES, SE DEBE "TOCAR" LA 
% TOLERANCIA PARA QUE FUNCIONE

tolerancia=0.00001;

C2zpk=zpk(((s-1)*(s+1))/((s-2)*s))
P2zpk=zpk((s-2))/((s+1)*(s-1))
L2zpk=minreal(P2zpk*C2zpk,tolerancia)

% CALCULO LAS SENSIBILIDADES DE LAZO CERRADO

S2=minreal(feedback(1,C2zpk*P2zpk),tolerancia)
T2=minreal(feedback(C2zpk*P2zpk,1),tolerancia)
PS2=minreal(P2zpk*S2,tolerancia)
CS2=minreal(C2zpk*S2,tolerancia)

%clear all;
A2=[0 1 ; 1 0]
B2=[0;1]
C2=[-2 1]
D2=0
P2ss=ss(A2,B2,C2,D2)
P2ss.u='mu'
P2ss.y='y'
P2check=zpk(P2ss)

Ac2=[0 1 ;0 2]
Bc2=[0;1]
Cc2=[-1 2] 
Dc2=1
C2ss=ss(Ac2,Bc2,Cc2,Dc2)
C2ss.u='e'
C2ss.y='u'
C2check=zpk(C2ss)

Sum1=sumblk('e=r-y');
Sum2=sumblk('mu=u+v');
CLSysFullss=connect(P2ss,C2ss,Sum1,Sum2,{'r','v'},{'e','mu'})




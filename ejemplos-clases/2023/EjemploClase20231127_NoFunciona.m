clear all;close all;clc

s=tf('s')

% p=1/(T/4)=4/T;

p1=40;
p2=80;
p3=160;

T1=4/p1;
T2=4/p2;
T3=4/p3;

Pap1=zpk([-1000 p1],[1000 -p1],-1);
Pap2=zpk([-1000 p2],[1000 -p2],-1);
Pap3=zpk([-1000 p3],[1000 -p3],-1);

PapA=zpk([-1000],[1000],1);

Pap1B=zpk([p1],[-p1],-1);
Pap2B=zpk([p2],[-p2],-1);
Pap3B=zpk([p3],[-p3],-1);


optionss=myBodeOptions;
optionss.MagVisible='off';

figure();bode(Pap1,Pap2,Pap3,optionss);
figure();bode(PapA,Pap1B,Pap2B,Pap3B,optionss);

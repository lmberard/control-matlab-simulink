% Ts=20mseg tau=40ms incognita p % tal que MF sea de 60 grados. 
% Solucion 90grados ya los tengo con una pendiente en el cruce a la
% wgc de -20db/dec , El lag aprotado por toda la parte Pap sera de
% 30 grados, entonces pongo que el Ts y tau combinados aporten 15 grados y
% el resto lo aporte el polo en p
clear all;close all;clc
s=tf('s');
Ts=20e-3
tau=40e-3
p=0.4
Paps=zpk([4/Ts],[-4/Ts],-1);
Paptau=zpk([2/tau],[-2/tau],-1);
Papstau=Paps * Paptau
Papp=zpk([-p],[p],1);
Paptotal=(Papstau * Papp)

optionss=bodeoptions;
optionss.MagVisible='off';
optionss.PhaseMatching='on';
optionss.PhaseMatchingValue=-180;
optionss.PhaseMatchingFreq=1;
optionss.Grid='on';
figure();bode(Papstau,Papp, Paptotal,optionss,{.1,1000});
title('Papstau Papp Paptotal');
legend('Papstau Ts=20ms y 40ms','Papp','(Papstau*Papp','Location','south');
set(findall(gcf,'type','line'),'linewidth',2);



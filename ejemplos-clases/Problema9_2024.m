%% Problema 9 TPO3 Practica:

clear all;close all;clc
s=tf('s');
Pap=zpk([-4],[4],1);
Pmp=zpk([],[-4 -4 -80],80)

optionss=bodeoptions;
%optionss.MagVisible='off';
optionss.PhaseMatching='on';
optionss.PhaseMatchingValue=-180;
optionss.PhaseMatchingFreq=1;
optionss.Grid='on';

P=minreal(Pap*Pmp);

figure();bode(Pmp,P,Pap,optionss,{.1,100});
set(findall(gcf,'type','line'),'linewidth',2);

%C=db2mag(4)*(s+.25)/s;
C=db2mag(40)*inv(Pmp)/s;
poloRegularizar = 400;
C=C*zpk(1/((s/poloRegularizar)+1))^2;

L=minreal(P*C);

freqrange={10^-1,1000};
figure();
bode(L,optionss,freqrange);title('L')
set(findall(gcf,'type','line'),'linewidth',2);

% GRUPO DE LAS 4.
S=1/(1+L);
T=1-S;
PS=minreal(P*S);
CS=minreal(C*S);


%%  Bodes
%optionss.MagVisible='on';
figure();
h1=subplot(2,2,1);
bode(L,optionss,freqrange);title('L')
optionss.PhaseVisible='off';
h2=subplot(2,2,2);
bode(S,T,optionss,freqrange);title('S & T')
h3=subplot(2,2,3);
bode(PS,optionss,freqrange);title('PS')
h4=subplot(2,2,4);
bode(CS,optionss,freqrange);title('CS')
set(findall(gcf,'type','line'),'linewidth',2);

figure();
time=10;
h1=subplot(3,1,1);
step(S,T,time);title('S & T');grid on
h2=subplot(3,1,2);
step(PS,time);title('PS');grid on
h3=subplot(3,1,3);
step(CS,time);title('CS');grid on
set(findall(gcf,'type','line'),'linewidth',2);
%linkaxes([h1 h2 h3], 'x');


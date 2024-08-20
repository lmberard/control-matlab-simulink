% EjemploClase20240610B.m
clear all;clc; % close all;
%%
optionss=myBodeOptions;
optionss.FreqUnits='rad/s';
optionss.Grid='on';
s=tf('s');

T0=.1;
T=.01;

P=zpk([],[-1 1],1);
Pap1=zpk(-1,1,1);
Pap2_0=zpk(1/(T0/4),-1/(T0/4),-1);
Pap2=zpk(1/(T/4),-1/(T/4),-1);
Pap=Pap1*Pap2;
Pap_0=Pap1*Pap2_0;
figure();bode(Pap1,Pap2,Pap2_0,Pap,Pap_0,optionss);

%%
Pmp=zpk([],[-1 -1],1);

Pt=zpk([],[-1 1 0],1);    % PLANTA FICT.
Ptmp=zpk([],[-1 -1 0],1); % PLANTA FICT MP.

Ptmp_cancelable=zpk([],[-1 -1],1);  % NOTAR que es igual a Pmp(s)
Ptmp_no_cancelable=zpk([],[0],1);   % El polo en el origen que finalmente 
                                    % pertenecera al controlador.

Ct1= db2mag(11.6)*inv(Ptmp_cancelable);            % Controlador Fict. 1er version

p=100;
Cideal = Ct1*(1/s);
C = Cideal*(1/(1+s/p));
Clp = Cideal*(1/(1+s/p)^2);
Cpid=pid(C);

%%

Lidealmp0=minreal(Ptmp*Ct1);
Lideal0=minreal(Pt*Ct1);

L=minreal(P*C*Pap2);
Llp=minreal(P*Clp*Pap2);


optionss= myBodeOptions;
figure();bode(C,Cideal,Clp,optionss);
set(findall(gcf,'type','line'),'linewidth',2)

figure();bode(Pt,Ptmp,Pap,optionss);
figure();bode(Lideal0,Lidealmp0,Pap,optionss);
figure();bode(Lideal0,L,Llp,optionss);

S=1/(1+L);
TT=1-S;

figure();step(TT)
% lsim
%figure();rlocus(P)
%figure();rlocus(Pt)
%figure();rlocus(Pt*Kt0)
%figure();nyqlog(minreal(Pt*Kt0))






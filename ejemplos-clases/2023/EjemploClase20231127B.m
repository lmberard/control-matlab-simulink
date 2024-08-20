%%

clear all;close all;clc

s=tf('s');

% z=1/(T/4)=4/T;

T = .01;
Tfinal=5;
p=100;

Po=1/(s+1)^3;
Pap=zpk(inv(T/4),-inv(T/4),-1);
%Co = db2mag(-15)*(1/s);
% Co = (1/s)*(s+1)^3*(1/(s/p+1)^2);
Co = db2mag(-11)*(1/s)*(s+1)

Lo=minreal(Po*Co);

So=zpk(1/(1+Lo))
To=1-So
PSo=minreal(zpk(Po*So))
CSo=minreal(zpk(Co*So))

%%

optionss=myBodeOptions;
optionss.FreqUnits='rad/s'
optionss.MagVisible='on';

figure();bode(Lo,optionss);
optionss.PhaseVisible='off';
figure();bode(So,To,Lo,optionss);
figure();bode(PSo,CSo,Lo,optionss);
figure();step(To,Tfinal);
figure();step(CSo,Tfinal);

Cd=c2d(Co,T,'tustin');

%figure();bode(PapA,Pap1B,Pap2B,Pap3B,optionss);



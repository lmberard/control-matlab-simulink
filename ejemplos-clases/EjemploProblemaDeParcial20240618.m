clear all; close all;clc;


s=tf('s');

Tequiv= 50e-3;
[num,den]=pade(Tequiv,1);
Pap1=exp(-50e-3*s);
Pap1B = tf(num,den);

optionss=bodeoptions;
optionss.MagVisible='off';
optionss.PhaseMatching='on';
optionss.PhaseMatchingValue=-180;
optionss.PhaseMatchingFreq=1;
optionss.Grid='on';

figure();
bode(Pap1,Pap1B,optionss,{1,100});grid on;
set(findall(gcf,'type','line'),'linewidth',2);

p=logspace(-1,1,8);

figure();
for ii=1:length(p)
    Pap2=zpk(-p(ii),p(ii),1);
    Pap=Pap1*Pap2;
    PapB=Pap1B*Pap2;
    bode(Pap,PapB,optionss,{.001,200});grid on; hold on
end
yline(-30)
set(findall(gcf,'type','line'),'linewidth',2);

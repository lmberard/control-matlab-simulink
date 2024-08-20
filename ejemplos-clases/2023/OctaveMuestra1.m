% https://wiki.octave.org/GNU_Octave_Wiki
% https://wiki.octave.org/Control_package
% https://gnu-octave.github.io/
% https://gnu-octave.github.io/pkg-control/

clear all;clc;close all;

isOctave = exist('OCTAVE_VERSION', 'builtin') ~= 0
if isOctave
  pkg load control
end

s=tf('s');
P=1/(s+1);
P1=P^3
P2=1/(s*(s+1)^2)

figure();bode(P);
figure();nyquist(P1);
figure();nyquist(P2);

P=zpk(1,[-1 -2],-1)
C=zpk([-1 -2],[1 -100 -100],-100*100)

L=minreal(P*C)

figure();step(L);
figure();step(C);


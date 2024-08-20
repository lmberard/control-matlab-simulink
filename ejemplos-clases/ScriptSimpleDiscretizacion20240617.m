% Script de inicializacion para el Simulink No Lineal del modelo de 
% tanques de 2ndo orden: ProblemaTanques20240610.slx

clear all;close all;clc;

K=zpk([-1],0,.2)

Ts=.01;
RetMediaMuestra = zpk(1/(Ts/4),-1/(Ts/4),-1);
Kd = c2d(K,Ts,'tustin');



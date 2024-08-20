clear all;close all;clc

s=tf('s')

L=0.38*(s^2+0.1*s + 0.55)/(s*(s+1)*(s^2+0.06*s + 0.5))

S = 1/(1+L)
T = 1-S % L/1+L

% optionss=myBodeOptions;
figure();bode(L)
figure();bode(S,T)
figure();step(T)
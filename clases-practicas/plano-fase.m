clear all;clc;close all
%ejemplo plano de fase Dazzo 14.7 StateSpace trajectories
t=[0:0.01:10];
x1=3*exp(-t)- 3*exp(-3*t);
x2=-exp(-t)+ 3*exp(-3*t);
figure

plot(x1,x2,'Color',[0,0.7,0.9])
grid on
title('plano de fase X1 X2')
xlabel('x1')
ylabel('x2')
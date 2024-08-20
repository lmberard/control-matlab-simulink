% Obtencion de funciones de transferencia 
num1 = [10];
den1 = [1 2 10];
num2 = [0 5];
den2 = [1 5];

% series
[num, den] = series(num1, den1, num2, den2);
printsys(num, den);

% paralelo
[num, den] = parallel(num1, den1, num2, den2);
printsys(num, den);

% feedback
[num, den] = feedback(num1, den1, num2, den2);
printsys(num, den);


% //////////////////////////////////////////////////////////////////
% Matrices de estado a partir de la transferencia
num = [1 0];
den = [1 14 56 160];
[A,B,C,D] = tf2ss(num, den);


% Transferencia a partir de las Matrices de estado
A = [0 1 0; 0 0 1;-5 -25 -5];
B = [0; 25; -120];
C = [1 0 0];
D = [0];
[num, den] = ss2tf(A, B, C, D);
[num, den] = ss2tf(A, B, C, D, 1);
% porque el 1 al final? porque representa la entradas u

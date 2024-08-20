A=[0 1;0 0];B[0;1]
A=[0 1;0 0];B=[0;1]
ctrb(A,B)
K=acker(A,B,[-10 -10])
eig(A-B*K)
A1=[-1 0;0 -1];B1=[1;1]
ctrb(A1,B1)
ctrb(A,B)
K1=acker(A1,B1,[-10 -10])
K=acker(A,B,[-2 -2])
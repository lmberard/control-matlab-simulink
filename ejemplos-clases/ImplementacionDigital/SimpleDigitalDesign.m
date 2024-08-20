clear all
s=tf('s');

C=(s+1)/s;
C2=db2mag(-10)*(s+1)^2/(s*(s/100+1));
C3=db2mag(-10)*(s+1)^2/(s*(s/100+1)*(s/1000+1)*(s^2 + 2*s +1));

T=0.04;
To=0.2;
Cd=ss(c2d(C,T,'tustin'));
Cd2=ss(c2d_euler(C2,T,'backward'));
Cd3=ss(c2d_euler(C3,T,'backward'));
    
[Acd,Bcd,Ccd,Dcd]=ssdata(Cd)
[Acd2,Bcd2,Ccd2,Dcd2]=ssdata(Cd2)
[Acd3,Bcd3,Ccd3,Dcd3]=ssdata(Cd3)
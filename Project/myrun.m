clc
clear all
close all

myfun = @(x) (0.0114*x(1)+0.01032*x(2)+0.0228*x(3)+0.0081*x(4))+15*(x(1)^0.03 + x(2)^0.01 + x(3)*0.0028 + x(4)^0.03);   
x0 = [1080;230;41;315];
A = [-1 -1 -1 -1;
     1 1 1 1;
     -0.59 -15.44 -7.12 -0.62;
     -79.77 0 0 -16.15; 
     -6.65 -59.1 -25.94 -4];
b = [1360;
     2268;
     70;
     560;
     114.3];
Aeq = [];
beq = [];
lb = [960,225,35,300];
ub = [1080,250,43,360];


options = optimoptions(@fmincon,'Display','iter','OptimalityTolerance',1e-08)
[x,fval,exitflag, output] = fmincon(myfun,x0,A,b,Aeq,beq,lb,ub,[],options);
x
fval
exitflag
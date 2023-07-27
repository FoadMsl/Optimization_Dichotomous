% =================================================
%       Foad Moslem (foad.moslem@gmail.com) - Researcher | Aerodynamics
%       Using MATLAB R2022a
% =================================================
clc
clear
close all

% =================================================
tic
global numFunc
numFunc = 0;

% Curve Ploting ======================================
a = 0;
b = 4;
NumOfNodes = 200;
x = linspace(a,b,NumOfNodes);
y = ObjFun(x);
plot(x,y)
hold on

% Main Code - Dichotomous ===========================
a1 = a;
b1 = b;
delta = 0.0001;
epsilon = 1e-3;
l = abs(a1-b1);

while l > epsilon
    l = abs (a1-b1);
    xm = (a1+b1)/2;
    x1 = xm - delta/2;
    x2 = xm + delta/2;
    fx1 = ObjFun (x1);
    fx2 = ObjFun (x2);
        if fx1 > fx2
            a1 = x1;
        elseif fx2 > fx1
             b1 = x2;
         else
            a1 = x1;
            b1 = x2;
        end
end
fxm = ObjFun(xm);

% =================================================
fprintf('Number of CallFunction: %6.f\n',numFunc)
fprintf('CPU time: %6.4f\n',toc)
fprintf('X Value of Optimum Point: %6.4f\n',xm)
fprintf('Y Value of Optimum Point: %6.4f\n',fxm)
plot(xm,fxm,'kx')
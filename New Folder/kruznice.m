clc;clear;
syms x y z r uX vX wX uY vY wY uZ vZ wZ 

vX=vX-uX; 
vY=vY-uY; 
vZ=vZ-uZ;

wX=wX-uX; 
wY=wY-uY; 
wZ=wZ-uZ;


kruzU = (x-uX)^2 + (y-uY)^2 + (z-uZ)^2 == r^2;
kruzU = simplify(kruzU)
x = solve(kruzU, x,'IgnoreAnalyticConstraints',true);
kruzV = (x(1)-vX)^2 + (y-vY)^2 + (z-vZ)^2 == r^2;
kruzV = simplify(kruzV);
y = solve(kruzV, y,'IgnoreAnalyticConstraints',true)
kruzW = (x(1)-wX)^2 + (y(1)-vZ)^2 + (z-wZ)^2 == r^2
kruzW = simplify(kruzW);
z = solve(kruzW, z,'IgnoreAnalyticConstraints',true)




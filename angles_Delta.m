function [aU,aV,aW] = angles_Delta(rozmer,konec, natazeni)

d1 = rozmer(1);
d2 = rozmer(2);
d3 = rozmer(3);
d4 = rozmer(4);
d5 = rozmer(5);
x5 = konec(1);
y5 = konec(2);
z5 = konec(3);
U = natazeni(1);
V = natazeni(2);
W = natazeni(3);
aU =(180*acos(((d1 - d5 - x5 + (2^(1/2)*U)/2 + (2^(1/2)*d3)/2)^2 - (d5 - d1 + x5)^2 + ((2^(1/2)*U)/2 + (2^(1/2)*d3)/2)^2)/(2*(y5^2 + (d1 - d5 - x5 + (2^(1/2)*U)/2 + (2^(1/2)*d3)/2)^2)^(1/2)*(((2^(1/2)*U)/2 + (2^(1/2)*d3)/2)^2)^(1/2))))/pi;
aV =(180*acos(((y5 - (3^(1/2)*d5)/2 + (3^(1/2)*(d1 + (2^(1/2)*V)/2 + (2^(1/2)*d3)/2))/2)^2 - (y5 + (3^(1/2)*d1)/2 - (3^(1/2)*d5)/2)^2 + ((3^(1/2)*d1)/2 - (3^(1/2)*(d1 + (2^(1/2)*V)/2 + (2^(1/2)*d3)/2))/2)^2 - (d1/2 - d5/2 + x5)^2 + (d1/2 - d5/2 + x5 + (2^(1/2)*V)/4 + (2^(1/2)*d3)/4)^2 + ((2^(1/2)*V)/4 + (2^(1/2)*d3)/4)^2)/(2*((y5 - (3^(1/2)*d5)/2 + (3^(1/2)*(d1 + (2^(1/2)*V)/2 + (2^(1/2)*d3)/2))/2)^2 + (d1/2 - d5/2 + x5 + (2^(1/2)*V)/4 + (2^(1/2)*d3)/4)^2)^(1/2)*(((3^(1/2)*d1)/2 - (3^(1/2)*(d1 + (2^(1/2)*V)/2 + (2^(1/2)*d3)/2))/2)^2 + ((2^(1/2)*V)/4 + (2^(1/2)*d3)/4)^2)^(1/2))))/pi;
aW =(180*acos(((y5 + (3^(1/2)*d5)/2 - (3^(1/2)*(d1 + (2^(1/2)*W)/2 + (2^(1/2)*d3)/2))/2)^2 - (y5 - (3^(1/2)*d1)/2 + (3^(1/2)*d5)/2)^2 + ((3^(1/2)*d1)/2 - (3^(1/2)*(d1 + (2^(1/2)*W)/2 + (2^(1/2)*d3)/2))/2)^2 - (d1/2 - d5/2 + x5)^2 + (d1/2 - d5/2 + x5 + (2^(1/2)*W)/4 + (2^(1/2)*d3)/4)^2 + ((2^(1/2)*W)/4 + (2^(1/2)*d3)/4)^2)/(2*((y5 + (3^(1/2)*d5)/2 - (3^(1/2)*(d1 + (2^(1/2)*W)/2 + (2^(1/2)*d3)/2))/2)^2 + (d1/2 - d5/2 + x5 + (2^(1/2)*W)/4 + (2^(1/2)*d3)/4)^2)^(1/2)*(((3^(1/2)*d1)/2 - (3^(1/2)*(d1 + (2^(1/2)*W)/2 + (2^(1/2)*d3)/2))/2)^2 + ((2^(1/2)*W)/4 + (2^(1/2)*d3)/4)^2)^(1/2))))/pi;
 

end
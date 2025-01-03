function [x,y,z] = trilaterate(rozmer, natazeni)
d1 = double(rozmer(1));
d2 = double(rozmer(2));
d3 = double(rozmer(3));
d4 = double(rozmer(4));
d5 = double(rozmer(5));
U = double(natazeni(1)/d2);
V = double(natazeni(2)/d2);
W = double(natazeni(3)/d2);
%% Rovnice přímek ramen
% Rameno U
xU = d1 + d3 * cosd(45) + U * d2 * sind(45);
yU = vpa(0);
zU = -d3 * sind(45) + U * d2 * cosd(45);

% Rameno V
xV = -cosd(60) * (d1 + d3 * cosd(45) + V * d2 * sind(45));
yV = -sind(60) * (d1 + d3 * cosd(45) + V * d2 * sind(45));
zV = -d3 * sind(45) + V * d2 * cosd(45);

% Rameno W
xW = -cosd(60) * (d1 + d3 * cosd(45) + W * d2 * sind(45));
yW = sind(60) * (d1 + d3 * cosd(45) + W * d2 * sind(45));
zW = -d3 * sind(45) + W * d2 * cosd(45);

%% Rovnice kružnic posunutých o konečný bod ramen
% Rameno U
xUk = xU - d5;
yUk = yU;
zUk = zU;

% Rameno V
xVk = xV - (-d5 * cosd(60));
yVk = yV - (-d5 * sind(60));
zVk = zV;

% Rameno W
xWk = xW - (-d5 * cosd(60));
yWk = yW - (d5 * sind(60));
zWk = zW;

%% Parametry sfér
P1 = [xUk, yUk, zUk];
P2 = [xVk, yVk, zVk];
P3 = [xWk, yWk, zWk];
r1 = double(500);
r2 = double(500);
r3 = double(500);

%% Výpočet průsečíku sfér
% Vypočítej jednotkový vektor e_x
temp1 = P2 - P1;
e_x = temp1 / norm(temp1);

% Projekce třetího bodu
temp2 = P3 - P1;
i = dot(e_x, temp2);
temp3 = temp2 - i * e_x;

% Vypočítej jednotkový vektor e_y
e_y = temp3 / norm(temp3);

% Vypočítej jednotkový vektor e_z
e_z = cross(e_x, e_y);

% Vzdálenost mezi P1 a P2
d = norm(P2 - P1);
j = dot(e_y, temp2);

% Vypočítej souřadnice x, y, z
x = (r1^2 - r2^2 + d^2) / (2 * d);
y = (r1^2 - r3^2 - 2 * i * x + i^2 + j^2) / (2 * j);

temp4 = r1^2 - x^2 - y^2;

if temp4 < 0
    error('The three spheres do not intersect!');
end

z = sqrt(temp4);

% Vypočítej dva průsečíky
konec = P1 + x * e_x + y * e_y + z * e_z;
    x = konec(1);
    y = konec(2);
    z = konec(3);
end
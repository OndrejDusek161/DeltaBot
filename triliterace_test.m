clc; clear; close all;
digits(50); % Nastavení přesnosti na 50 desetinných míst pro vpa

%% Parametry ramen a kružnic

d1 = vpa(50);
d2 = vpa(370);
d3 = vpa(50);
d4 = vpa(500);
d5 = vpa(50);

U = vpa(100) / d2;
V = vpa(100) / d2;
W = vpa(100) / d2;

% syms d1 d2 d3 d4 d5 U V W

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
r1 = vpa(500);
r2 = vpa(500);
r3 = vpa(500);

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
%{
if temp4 < 0
    error('The three spheres do not intersect!');
end
%}
z = sqrt(temp4);

% Vypočítej dva průsečíky
konec = P1 + x * e_x + y * e_y + z * e_z;
% Zobraz výsledky
disp('Koncový bod:');
disp(konec);
x5 = konec(1);
y5 = konec(2);
z5 = konec(3);
%% Otestování

u = struct( ...
    'x', [0, d1,            d1+U*sind(45),  d1+U*d2*sind(45)+d3*cosd(45),            x5+d5,             x5], ...
    'y', [0, 0,             0,               0,                                    y5,               y5], ...
    'z', [0, 0,             U*cosd(45),    -d3*sind(45)+U*d2*cosd(45),               z5,                z5]);
v = struct( ...
    'x', [0, -cosd(60)*d1, -cosd(60)*(d1+V*d2*sind(45)), -cosd(60)*(d1+V*d2*sind(45)+d3*cosd(45)), x5-d5*cosd(60), x5], ...
    'y', [0, -sind(60)*d1, -sind(60)*(d1+V*d2*sind(45)), -sind(60)*(d1+V*d2*sind(45)+d3*cosd(45)), y5-d5*sind(60), y5], ...
    'z', [0, 0,             V*d2*cosd(45),                -d3*sind(45)+V*d2*cosd(45),               z5,             z5]);
w = struct( ...
    'x', [0, -cosd(60)*d1, -cosd(60)*(d1+W*d2*sind(45)), -cosd(60)*(d1+W*d2*sind(45)+d3*cosd(45)), x5-d5*cosd(60), x5], ...
    'y', [0, sind(60)*d1,   sind(60)*(d1+W*d2*sind(45)),  sind(60)*(d1+W*d2*sind(45)+d3*cosd(45)), y5+d5*sind(60), y5], ...
    'z', [0, 0,             W*d2*cosd(45),               -d3*sind(45)+W*d2*cosd(45),               z5,             z5]);

p1 = [w.x(4),w.y(4),w.z(4)];
p2 = [w.x(5),w.y(5),w.z(5)];
d = norm(p1 - p2)
%% Vykreslení sfér a průsečíků

figure;
hold on;
vykresleni_deltabot([d1,d2,d3,d4,d5], konec)
% Generování jednotkové sféry
[usph_x, usph_y, usph_z] = sphere(50);
scatter3(p1(1), p1(2), p1(3), 'x')
scatter3(p2(1), p2(2), p2(3), 'o')
% Vykreslení první sféry

surf(double(P1(1)) + double(r1) * usph_x, ...
     double(P1(2)) + double(r1) * usph_y, ...
     double(P1(3)) + double(r1) * usph_z, ...
     'FaceAlpha', 0.5, 'EdgeColor', 'none');

% Vykreslení druhé sféry
surf(double(P2(1)) + double(r2) * usph_x, ...
     double(P2(2)) + double(r2) * usph_y, ...
     double(P2(3)) + double(r2) * usph_z, ...
     'FaceAlpha', 0.5, 'EdgeColor', 'none');

% Vykreslení třetí sféry
surf(double(P3(1)) + double(r3) * usph_x, ...
     double(P3(2)) + double(r3) * usph_y, ...
     double(P3(3)) + double(r3) * usph_z, ...
     'FaceAlpha', 0.5, 'EdgeColor', 'none');

% Vykreslení průsečíků
scatter3(double(konec(1)), double(konec(2)), double(konec(3)), 100, 'r', 'filled');

% Popisky
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Průsečík tří sfér');
legend('Sfera 1', 'Sfera 2', 'Sfera 3', 'Průsečík 1', 'Průsečík 2');
grid on;
axis equal;
hold off;

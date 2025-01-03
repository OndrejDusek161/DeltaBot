
syms d1 d2 d3 d4 d5 x5 y5 z5 U V W

% d1 = 50; %offset
% d2 = 370; % rameno
% d3 = 50; % offset od ramena
% d4 = 500; %karbon tyc
% d5 = 50; %offset k konec bodu
% rozmer = [d1,d2,d3,d4,d5];
% x5 = 0;
% y5 = -100;
% z5 = -300;
% konec = [x5,y5,z5];
% [U, V, W] = InverzniKinematika([d1,d2,d3,d4,d5], [x5,y5,z5]);

u = struct( ...
    'x', [0, d1,            d1+U*sind(45),  d1+U*sind(45)+d3*cosd(45),            x5+d5,             x5], ...
    'y', [0, 0,             0,               0,                                    y5,               y5], ...
    'z', [0, 0,             U*cosd(45),    -d3*sind(45)+U*cosd(45),               z5,                z5]);
v = struct( ...
    'x', [0, -cosd(60)*d1, -cosd(60)*(d1+V*sind(45)), -cosd(60)*(d1+V*sind(45)+d3*cosd(45)), x5-d5*cosd(60), x5], ...
    'y', [0, -sind(60)*d1, -sind(60)*(d1+V*sind(45)), -sind(60)*(d1+V*sind(45)+d3*cosd(45)), y5-d5*sind(60), y5], ...
    'z', [0, 0,             V*cosd(45),                -d3*sind(45)+V*cosd(45),               z5,             z5]);
w = struct( ...
    'x', [0, -cosd(60)*d1, -cosd(60)*(d1+W*sind(45)), -cosd(60)*(d1+W*sind(45)+d3*cosd(45)), x5-d5*cosd(60), x5], ...
    'y', [0, sind(60)*d1,   sind(60)*(d1+W*sind(45)),  sind(60)*(d1+W*sind(45)+d3*cosd(45)), y5+d5*sind(60), y5], ...
    'z', [0, 0,             W*cosd(45),               -d3*sind(45)+W*cosd(45),               z5,             z5]);

%% Rameno U
Au = [u.x(1),u.y(1)]
Bu = [u.x(2),u.y(2)]
Cu = [u.x(3),u.y(3)]
Du = [u.x(4),u.y(4)]
Eu = [u.x(5),u.y(5)]
Fu = [u.x(6),u.y(6)]
eu = sqrt((Du(1) - Bu(1))^2+(Du(2) - Bu(2))^2)
bu = sqrt((Du(1) - Eu(1))^2+(Du(2) - Eu(2))^2)
du = sqrt((Eu(1) - Bu(1))^2+(Eu(2) - Bu(2))^2)
alfaU = acos((bu^2+eu^2-du^2)/(2*eu*bu))*180/pi
alfaU = simplify(alfaU)

%rameno V
Av = [v.x(1),v.y(1)];
Bv = [v.x(2),v.y(2)];
Cv = [v.x(3),v.y(3)];
Dv = [v.x(4),v.y(4)];
Ev = [v.x(5),v.y(5)];
Fv = [v.x(6),v.y(6)];
ev = sqrt((Bv(1) - Dv(1))^2+(Bv(2) - Dv(2))^2);
bv = sqrt((Ev(1) - Dv(1))^2+(Ev(2) - Dv(2))^2);
dv = sqrt((Ev(1) - Bv(1))^2+(Ev(2) - Bv(2))^2);
alfaV = acos((bv^2+ev^2-dv^2)/(2*ev*bv))*180/pi
alfaV = simplify(alfaV)
%rameno V
Aw = [w.x(1),w.y(1)];
Bw = [w.x(2),w.y(2)];
Cw = [w.x(3),w.y(3)];
Dw = [w.x(4),w.y(4)];
Ew = [w.x(5),w.y(5)];
Fw = [w.x(6),w.y(6)];
ew = sqrt((Bw(1) - Dw(1))^2+(Bw(2) - Dw(2))^2);
bw = sqrt((Ew(1) - Dw(1))^2+(Ew(2) - Dw(2))^2);
dw = sqrt((Ew(1) - Bw(1))^2+(Ew(2) - Bw(2))^2);
alfaW = acos((bw^2+ew^2-dw^2)/(2*ew*bw))*180/pi
alfaW = simplify(alfaW)
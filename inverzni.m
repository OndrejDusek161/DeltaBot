
clc;clear;
syms tu tv tw d1 d2 d3 d4 d5 x5 y5 z5;
sympref("FloatingPointOutput",false)
format long
%{
d1 = 50; %offset
d2 = 370; % rameno
d3 = 50; % offset od ramena
d4 = 500; %karbon tyc
d5 = 50; %offset k konec bodu

x5 = 0;
y5 = 0;
z5 = -300;
%}
konec = [x5,y5,z5];

    %% rovnice primek ramen
    %rameno U
    xu = d1+d3*cosd(45)+tu*d2*sind(45);
    yu = 0;
    zu = -d3*sind(45)+tu*d2*cosd(45);
    %rameno V
    xv = -cosd(60)*(d1+d3*cosd(45)+tv*d2*sind(45));
    yv = -sind(60)*(d1+d3*cosd(45)+tv*d2*sind(45));
    zv = -d3*sind(45)+tv*d2*cosd(45);
    %rameno W
    xw = -cosd(60)*(d1+d3*cosd(45)+tw*d2*sind(45));
    yw = sind(60)*(d1+d3*cosd(45)+tw*d2*sind(45));
    zw = -d3*sind(45)+tw*d2*cosd(45);
    %% rovnice kruznic u konecneho bodu
    %rameno U
    xu4 = x5+d5;
    yu4 = y5;
    zu4 = z5;
    %rameno V
    xv4 = x5-d5*cosd(60);
    yv4 = y5-d5*sind(60);
    zv4 = z5;
    %rameno W
    xw4 = x5-d5*cosd(60);
    yw4 = y5+d5*sind(60);
    zw4 = z5;
    %% dosazeni do rovnic
    eqnKruzU = (xu-xu4)^2 + (yu-yu4)^2 + (zu-zu4)^2 == d4^2;
    eqU = solve(eqnKruzU, tu);
    eqnKruzV = (xv-xv4)^2 + (yv-yv4)^2 + (zv-zv4)^2 == d4^2;
    eqV = solve(eqnKruzV, tv);
    eqnKruzW = (xw-xw4)^2 + (yw-yw4)^2 + (zw-zw4)^2 == d4^2;
    eqW = solve(eqnKruzW, tw);
    
    U = simplify(d2*eqU)
    V = simplify(d2*eqV)
    W = simplify(d2*eqW)
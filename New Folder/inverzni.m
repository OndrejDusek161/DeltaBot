%funkce vrátí hodnoty natazeni motoru
%function [U, V, W] = InverzniKinematika(rozmery,konecny_bod)
sympref("FloatingPointOutput",false)
format long
clc;clear;
    syms tu tv tw d1 d2 d3 d4 d5 x5 y5 z5;
   %{
    d1 = 50; %offset
    d2 = 460; % rameno
    d3 = 50; % offset od ramena
    d4 = 500; %karbon tyc
    d5 = 50; %offset k konec bodu
    
    x5 = 10;
    y5 = 10;
    z5 = -300;
   %}
    %% rovnice primek ramen
    %rameno U
    xu = d1+d3*cosd(45)+tu*d2*sind(45);
    yu = -sind(0)*(d1+d3*cosd(45)+tu*d2*sind(45));
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
    
    
    U = (2^(1/2)*(d5 - d1 + x5 + z5 + (- d1^2 - 2*2^(1/2)*d1*d3 + 2*d1*d5 + 2*d1*x5 - 2*d1*z5 - 2*d3^2 + 2*2^(1/2)*d3*d5 + 2*2^(1/2)*d3*x5 - 2*2^(1/2)*d3*z5 + 2*d4^2 - d5^2 - 2*d5*x5 + 2*d5*z5 - x5^2 + 2*x5*z5 - 2*y5^2 - z5^2)^(1/2)))/2
    V = (2^(1/2)*d5)/2 - (2^(1/2)*d1)/2 - (2^(1/2)*x5)/4 - (6^(1/2)*y5)/4 + (2^(1/2)*z5)/2 + (2^(1/2)*(- 4*d1^2 - 8*2^(1/2)*d1*d3 + 8*d1*d5 - 4*d1*x5 - 4*3^(1/2)*d1*y5 - 8*d1*z5 - 8*d3^2 + 8*2^(1/2)*d3*d5 - 4*2^(1/2)*d3*x5 - 4*6^(1/2)*d3*y5 - 8*2^(1/2)*d3*z5 + 8*d4^2 - 4*d5^2 + 4*d5*x5 + 4*3^(1/2)*d5*y5 + 8*d5*z5 - 7*x5^2 + 2*3^(1/2)*x5*y5 - 4*x5*z5 - 5*y5^2 - 4*3^(1/2)*y5*z5 - 4*z5^2)^(1/2))/4
    W = (2^(1/2)*d5)/2 - (2^(1/2)*d1)/2 - (2^(1/2)*x5)/4 + (6^(1/2)*y5)/4 + (2^(1/2)*z5)/2 + (4*d1*d5 - 2*d1*x5 + 2*d5*x5 - 4*d1*z5 + 4*d5*z5 - 2*x5*z5 - 2*d1^2 - 4*d3^2 + 4*d4^2 - 2*d5^2 - (7*x5^2)/2 - (5*y5^2)/2 - 2*z5^2 - 4*2^(1/2)*d1*d3 + 4*2^(1/2)*d3*d5 - 2*2^(1/2)*d3*x5 + 2*3^(1/2)*d1*y5 - 2*3^(1/2)*d5*y5 + 2*6^(1/2)*d3*y5 - 4*2^(1/2)*d3*z5 - 3^(1/2)*x5*y5 + 2*3^(1/2)*y5*z5)^(1/2)/2

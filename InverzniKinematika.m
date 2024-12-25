%==========================================================================
% Název souboru:   InverzniKinematika.m
% Autor:           Ondřej Dušek
% Verze:           1.1
% Datum:           25.12.2024
% Popis:          
%   Výpočet inverzní kinematiky deltabota
%
% Vstupy:
%   - rozmery = rozměry deltabota
%   - konec = souřadnice koncového bodu
%
% Výstupy:
%   - natažení ramen [U, V, W]
%
% verze
% 1.0 - initial
% 1.1 - přidání varování nemožné pozice
%==========================================================================

function [U, V, W] = InverzniKinematika(rozmery,konecny_bod)
    d(1) = double(rozmery(1)); %offset
    d(2) = double(rozmery(2)); % rameno
    d(3) = double(rozmery(3)); % offset od ramena
    d(4) = double(rozmery(4)); %karbon tyc
    d(5) = double(rozmery(5)); %offset k konec bodu
    x5 = konecny_bod(1);
    y5 = konecny_bod(2);
    z5 = konecny_bod(3);
    %{
    %% rovnice primek ramen
    %rameno U
    xu = d(1)+d(3)*cosd(45)+tu*d(2)*sind(45);
    yu = 0;
    zu = -d(3)*sind(45)+tu*d(2)*cosd(45);
    %rameno V
    xv = -cosd(60)*(d(1)+d(3)*cosd(45)+tv*d(2)*sind(45));
    yv = -sind(60)*(d(1)+d(3)*cosd(45)+tv*d(2)*sind(45));
    zv = -d(3)*sind(45)+tv*d(2)*cosd(45);
    %rameno W
    xw = -cosd(60)*(d(1)+d(3)*cosd(45)+tw*d(2)*sind(45));
    yw = sind(60)*(d(1)+d(3)*cosd(45)+tw*d(2)*sind(45));
    zw = -d(3)*sind(45)+tw*d(2)*cosd(45);
    %% rovnice kruznic u konecneho bodu
    %rameno U
    xu4 = x5+d(5);
    yu4 = y5;
    zu4 = z5;
    %rameno V
    xv4 = x5-d(5)*cosd(60);
    yv4 = y5-d(5)*sind(60);
    zv4 = z5;
    %rameno W
    xw4 = x5-d(5)*cosd(60);
    yw4 = y5+d(5)*sind(60);
    zw4 = z5;
    %% dosazeni do rovnic
    eqnKruzU = (xu-xu4)^2 + (yu-yu4)^2 + (zu-zu4)^2 == d(4)^2;
    eqU = solve(eqnKruzU, tu);
    eqnKruzV = (xv-xv4)^2 + (yv-yv4)^2 + (zv-zv4)^2 == d(4)^2;
    eqV = solve(eqnKruzV, tv);
    eqnKruzW = (xw-xw4)^2 + (yw-yw4)^2 + (zw-zw4)^2 == d(4)^2;
    eqW = solve(eqnKruzW, tw);
    %}
    U = (2^(1/2)*(d(5) - d(1) + x5 + z5 + (- d(1)^2 - 2*2^(1/2)*d(1)*d(3) + 2*d(1)*d(5) + 2*d(1)*x5 - 2*d(1)*z5 - 2*d(3)^2 + 2*2^(1/2)*d(3)*d(5) + 2*2^(1/2)*d(3)*x5 - 2*2^(1/2)*d(3)*z5 + 2*d(4)^2 - d(5)^2 - 2*d(5)*x5 + 2*d(5)*z5 - x5^2 + 2*x5*z5 - 2*y5^2 - z5^2)^(1/2)))/2;
    V = (2^(1/2)*d(5))/2 - (2^(1/2)*d(1))/2 - (2^(1/2)*x5)/4 - (6^(1/2)*y5)/4 + (2^(1/2)*z5)/2 + (2^(1/2)*(- 4*d(1)^2 - 8*2^(1/2)*d(1)*d(3) + 8*d(1)*d(5) - 4*d(1)*x5 - 4*3^(1/2)*d(1)*y5 - 8*d(1)*z5 - 8*d(3)^2 + 8*2^(1/2)*d(3)*d(5) - 4*2^(1/2)*d(3)*x5 - 4*6^(1/2)*d(3)*y5 - 8*2^(1/2)*d(3)*z5 + 8*d(4)^2 - 4*d(5)^2 + 4*d(5)*x5 + 4*3^(1/2)*d(5)*y5 + 8*d(5)*z5 - 7*x5^2 + 2*3^(1/2)*x5*y5 - 4*x5*z5 - 5*y5^2 - 4*3^(1/2)*y5*z5 - 4*z5^2)^(1/2))/4;
    W = (2^(1/2)*d(5))/2 - (2^(1/2)*d(1))/2 - (2^(1/2)*x5)/4 + (6^(1/2)*y5)/4 + (2^(1/2)*z5)/2 + (4*d(1)*d(5) - 2*d(1)*x5 + 2*d(5)*x5 - 4*d(1)*z5 + 4*d(5)*z5 - 2*x5*z5 - 2*d(1)^2 - 4*d(3)^2 + 4*d(4)^2 - 2*d(5)^2 - (7*x5^2)/2 - (5*y5^2)/2 - 2*z5^2 - 4*2^(1/2)*d(1)*d(3) + 4*2^(1/2)*d(3)*d(5) - 2*2^(1/2)*d(3)*x5 + 2*3^(1/2)*d(1)*y5 - 2*3^(1/2)*d(5)*y5 + 2*6^(1/2)*d(3)*y5 - 4*2^(1/2)*d(3)*z5 - 3^(1/2)*x5*y5 + 2*3^(1/2)*y5*z5)^(1/2)/2;
    %vypsání uživateli, že je pozice nedosažitelná
    if U > d(2) || U < 0 || V > d(2) || V < 0 || W > d(2) || W < 0
        warning('Pozice (%.2f, %.2f, %.2f) není dosažitelná.', x5, y5, z5);
    end
    
end
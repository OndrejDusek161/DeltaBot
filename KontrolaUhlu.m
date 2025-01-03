%==========================================================================
% Název souboru:   KontrolaUhluCista.m
% Autor:           Ondřej Dušek
% Verze:           1.1
% Datum:           25.12.2024
% Popis:          
%   výpočet úhlů kloubů ramen
%
% Vstupy:
%   - rozmery = rozměry deltabota
%   - konec = pozice koncového bodu
% 
% Výstupy: 
%   - uhly = úhly kloubů jednotlivých ramen
%   
% 1.0 - init
% 1.1 - simplify rovnic
% 
%==========================================================================
function [alfaU,alfaV,alfaW] = KontrolaUhlu(rozmery,konec)

% syms d(1) d(2) d(3) d(4) d(5) x5 y5 z5 U V W

d1 = double(rozmery(1)); %offset
d2 = double(rozmery(2)); % rameno
d3 = double(rozmery(3)); % offset od ramena
d4 = double(rozmery(4)); %karbon tyc
d5 = double(rozmery(5)); %offset k konec bodu
x5 = double(konec(1));
y5 = double(konec(2));
z5 = double(konec(3));
[U, V, W] = InverzniKinematika(rozmery, konec);

%% Výpočty úhlů jednotlivých ramen 
% Rameno U
alfaU = (180*acos((2^(1/2)*(U + d3)*(U + d3 + 2^(1/2)*d1 - 2^(1/2)*d5 - 2^(1/2)*x5))/(((U + d3)^2)^(1/2)*((2*d1 - 2*d5 - 2*x5 + 2^(1/2)*U + 2^(1/2)*d3)^2 + 4*y5^2)^(1/2))))/pi;

%rameno V
alfaV = (180*acos((2^(1/2)*(V + d3)*(2*V + 2*d3 + 2*2^(1/2)*d1 - 2*2^(1/2)*d5 + 2^(1/2)*x5 + 6^(1/2)*y5))/(((V + d3)^2)^(1/2)*((4*y5 + 6^(1/2)*V + 2*3^(1/2)*d1 - 2*3^(1/2)*d5 + 6^(1/2)*d3)^2 + (2*d1 - 2*d5 + 4*x5 + 2^(1/2)*V + 2^(1/2)*d3)^2)^(1/2))))/pi;

%rameno W
alfaW = (180*acos((2^(1/2)*(W + d3)*(2*W + 2*d3 + 2*2^(1/2)*d1 - 2*2^(1/2)*d5 + 2^(1/2)*x5 - 6^(1/2)*y5))/(((W + d3)^2)^(1/2)*((6^(1/2)*W - 4*y5 + 2*3^(1/2)*d1 - 2*3^(1/2)*d5 + 6^(1/2)*d3)^2 + (2*d1 - 2*d5 + 4*x5 + 2^(1/2)*W + 2^(1/2)*d3)^2)^(1/2))))/pi;

end
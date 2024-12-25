%==========================================================================
% Název souboru:   KontrolaUhluCista.m
% Autor:           Ondřej Dušek
% Verze:           1.0
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
%==========================================================================
function [x5,y5,z5] = KontrolaUhluCista(rozmery,konec)

% syms d(1) d(2) d(3) d(4) d(5) x5 y5 z5 U V W

d(1) = rozmery(1); %offset
d(2) = rozmery(2); % rameno
d(3) = rozmery(3); % offset od ramena
d(4) = rozmery(4); %karbon tyc
d(5) = rozmery(5); %offset k konec bodu
x5 = konec(1);
y5 = konec(2);
z5 = konec(3);
[U, V, W] = InverzniKinematika([d(1),d(2),d(3),d(4),d(5)], [x5,y5,z5]);

%% Výpočty úhlů jednotlivých ramen 
% Rameno U
alfaU = (180*acos(((d(1) - d(5) - x5 + (2^(1/2)*U)/2 + (2^(1/2)*d(3))/2)^2 - (d(5) - d(1) + x5)^2 + ((2^(1/2)*U)/2 + (2^(1/2)*d(3))/2)^2)/(2*(y5^2 + (d(1) - d(5) - x5 + (2^(1/2)*U)/2 + (2^(1/2)*d(3))/2)^2)^(1/2)*(((2^(1/2)*U)/2 + (2^(1/2)*d(3))/2)^2)^(1/2))))/pi;

%rameno V
alfaV = (180*acos(((y5 - (3^(1/2)*d(5))/2 + (3^(1/2)*(d(1) + (2^(1/2)*V)/2 + (2^(1/2)*d(3))/2))/2)^2 - (y5 + (3^(1/2)*d(1))/2 - (3^(1/2)*d(5))/2)^2 + ((3^(1/2)*d(1))/2 - (3^(1/2)*(d(1) + (2^(1/2)*V)/2 + (2^(1/2)*d(3))/2))/2)^2 - (d(1)/2 - d(5)/2 + x5)^2 + (d(1)/2 - d(5)/2 + x5 + (2^(1/2)*V)/4 + (2^(1/2)*d(3))/4)^2 + ((2^(1/2)*V)/4 + (2^(1/2)*d(3))/4)^2)/(2*((y5 - (3^(1/2)*d(5))/2 + (3^(1/2)*(d(1) + (2^(1/2)*V)/2 + (2^(1/2)*d(3))/2))/2)^2 + (d(1)/2 - d(5)/2 + x5 + (2^(1/2)*V)/4 + (2^(1/2)*d(3))/4)^2)^(1/2)*(((3^(1/2)*d(1))/2 - (3^(1/2)*(d(1) + (2^(1/2)*V)/2 + (2^(1/2)*d(3))/2))/2)^2 + ((2^(1/2)*V)/4 + (2^(1/2)*d(3))/4)^2)^(1/2))))/pi;

%rameno W
alfaW = (180*acos(((y5 + (3^(1/2)*d(5))/2 - (3^(1/2)*(d(1) + (2^(1/2)*W)/2 + (2^(1/2)*d(3))/2))/2)^2 - (y5 - (3^(1/2)*d(1))/2 + (3^(1/2)*d(5))/2)^2 + ((3^(1/2)*d(1))/2 - (3^(1/2)*(d(1) + (2^(1/2)*W)/2 + (2^(1/2)*d(3))/2))/2)^2 - (d(1)/2 - d(5)/2 + x5)^2 + (d(1)/2 - d(5)/2 + x5 + (2^(1/2)*W)/4 + (2^(1/2)*d(3))/4)^2 + ((2^(1/2)*W)/4 + (2^(1/2)*d(3))/4)^2)/(2*((y5 + (3^(1/2)*d(5))/2 - (3^(1/2)*(d(1) + (2^(1/2)*W)/2 + (2^(1/2)*d(3))/2))/2)^2 + (d(1)/2 - d(5)/2 + x5 + (2^(1/2)*W)/4 + (2^(1/2)*d(3))/4)^2)^(1/2)*(((3^(1/2)*d(1))/2 - (3^(1/2)*(d(1) + (2^(1/2)*W)/2 + (2^(1/2)*d(3))/2))/2)^2 + ((2^(1/2)*W)/4 + (2^(1/2)*d(3))/4)^2)^(1/2))))/pi;

end
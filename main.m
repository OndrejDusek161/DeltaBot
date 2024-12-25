%==========================================================================
% Název souboru:   main.m
% Autor:           Ondřej Dušek
% Verze:           1.0
% Datum:           25.12.2024
% Popis:          
%   hlavní soubor pro testování funkcí deltabota
%==========================================================================

sympref("FloatingPointOutput",false)
format long

clc;clear;close all;
%offset %rameno %offset od ramena %karbon tyc %offset k konec bodu
rozmer = [50,370,50,500,50];

konecny_bod = [0,50,-300]; %[x,y,z]
tic
[U, V, W] = InverzniKinematika(rozmer,konecny_bod);
dobaInverzniKinematika = toc;

natazeni = [U, V, W];;

tic
[x,y,z] = PrimaKinematika2(rozmer,natazeni);
dobaPrimaKinematika = toc;

tic
[aU, aV, aW] = KontrolaUhluCista(rozmer, konecny_bod);
dobaUhly = toc;

vykresleni_deltabot(rozmer, konecny_bod);

fprintf("Doba výpočtů kinematik: \n\t" + ...
    "Inverní kinematika:\t %.6f s \n\t" + ...
    "Přímá kinematika:\t %.6f s  \n\t" + ...
    "Výpočet úhlů:\t\t %.6f s \n\t" ...
    , dobaInverzniKinematika, dobaPrimaKinematika, dobaUhly);

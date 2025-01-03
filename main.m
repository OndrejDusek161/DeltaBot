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
U = rand() * 370;
V = rand() * 370;
W = rand() * 370;
rozmer = [50,370,50,500,50];
rozmer = double(rozmer);
konecny_bod = [-10,10,-300]; %[x,y,z]
konecny_bod = double(konecny_bod);
natazeni = [300,250,200];
tic
[U, V, W] = InverzniKinematika(rozmer,konecny_bod);
dobaInverzniKinematika = toc;

tic
[x,y,z] = PrimaKinematika(rozmer,natazeni);
dobaPrimaKinematika = toc;
tic

tic
[x,y,z] = trilaterate(rozmer, natazeni);
dobaPrimaKinematikaTriliterace = toc;
konecny_bod = [x,y,z];
[aU, aV, aW] = KontrolaUhlu(rozmer, konecny_bod);
dobaUhly = toc
vykresleni_deltabot(rozmer, konecny_bod);
fprintf("Doba výpočtů kinematik: \n\t" + ...
    "Inverní kinematika:\t %.6f s \n\t" + ...
    "Přímá kinematika orig:\t %.6f s  \n\t" + ...
    "Přímá kinematika Triliterace:\t %.6f s  \n\t" ...
    , dobaInverzniKinematika ...
    , dobaPrimaKinematika ...
    , dobaPrimaKinematikaTriliterace);

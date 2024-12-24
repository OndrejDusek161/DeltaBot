sympref("FloatingPointOutput",false)
format long
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Program vypočítá inverzní a poté primou kinematiku pro zadaný konecný bod
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear;
d1a = 50; %offset
d2a = 370; % rameno
d3a = 50; % offset od ramena
d4a = 500; %karbon tyc
d5a = 50; %offset k konec bodu
rozmer = [d1a,d2a,d3a,d4a,d5a];
x5 = 80;
y5 = 50;
z5 = -200;
konec = [x5,y5,z5];
tic
[U, V, W] = InverzniKinematika(rozmer,konec)
toc
%f = @()InverzniKinematika(rozmer,konec);
%timeit(f)
natazeni = [U V W];
%f = @()PrimaKinematika(rozmer,natazeni);
%timeit(f)
tic
[x,y,z] = PrimaKinematika2(rozmer,natazeni)
toc

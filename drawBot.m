clc;clear;
sympref("FloatingPointOutput",false);

maxAngle = 40;
d1 = 50; %offset
d2 = 370; % rameno
d3 = 50; % offset od ramena
d4 = 500; %karbon tyc
d5 = 50; %offset k konec bodu
rozmer = [d1,d2,d3,d4,d5];
x5 = 0;
y5 = 0;
z5 = -300;
konec = [x5,y5,z5];

[U, V, W] = InverzniKinematika(rozmer,konec)
%Vykresleni zobrazeni deltarobotu
vykresleni_deltabot(rozmer,konec); 
i = 1;
calculate = 0;
tic
%% Vypocty
if calculate == 1
    data = zeros(7,135*135*135);
    for Uos = 100:10:370
        for Vos = 100:10:370
            for Wos = 10:10:370
                %vypocet bodu
                [xos, yos, zos] = PrimaKinematika2(rozmer,[Uos, Vos, Wos]); 
                % vypocet a kontrola uhlu ramen
                [aU, aV, aW] = angles_Delta(rozmer, [xos, yos, zos], [Uos, Vos, Wos]); 
                if aU > maxAngle || aV > maxAngle || aW > maxAngle
                    continue
                end
                
                data(1,i) = xos;
                data(2,i) = yos;
                data(3,i) = -zos;
                data(4,i) = Uos;
                data(5,i) = Vos;
                data(6,i) = Wos;
                i = i+1;
            end
        end
    end
    %zapis do souboru
    %writematrix(data,"prac_plocha_tyc_500mm_prim.txt");
    %writematrix(data,"prac_plocha_tyc_500mm_prim_maxUhel_30.txt");
    % writematrix(data,"prac_plocha_tyc_500mm_prim_maxUhel_40.txt");
    writematrix(data,"prac_plocha_tyc_500mm_prim_maxUhel_40_ver2.txt");
    %writematrix(data,"prac_plocha_tyc_600mm_prim.txt");
    %writematrix(data,"prac_plocha_tyc_500mm.txt");
    %writematrix(data,"prac_plocha_tyc_600mm.txt");
end
toc

%vykresleni pracovni plochy
%data = readmatrix("prac_plocha_tyc_500mm_prim_maxUhel_40_ver2.txt");

%data2 = readmatrix("prac_plocha_tyc_500mm_prim_maxUhel_20.txt");
% view(3);
%scatter3(data(1,:),data(2,:),data(3,:),'.', 'r');
%hold on
%scatter3(data2(1,:),data2(2,:),data2(3,:),'x', 'b');
% xlabel x[mm];
% ylabel y[mm];
% zlabel z[mm];
% title("Pracovni plocha delta robotu pro limitní úhel 40 a 20 stupnu");
% 
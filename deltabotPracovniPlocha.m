clc;clear;
sympref("FloatingPointOutput",false);

maxAngle = 40;
d1 = 59; %offset
d2 = 385; % rameno
d3 = 35; % offset od ramena
d4 = 500; %karbon tyc
d5 = 46; %offset k konec bodu
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

%tic         %časování výpočtů
%% Výpočty pracovní plochy
if calculate == 1
    data = zeros(7,135*135*135);
    for Uos = 100:10:370
        for Vos = 100:10:370
            for Wos = 100:10:370
                %vypocet bodu
                [xos, yos, zos] = PrimaKinematika(rozmer,[Uos, Vos, Wos]); 
                % vypocet a kontrola uhlu ramen
                [aU, aV, aW] = KontrolaUhlu(rozmer, [xos, yos, zos]); 
                if aU > maxAngle || aV > maxAngle || aW > maxAngle
                    continue
                end
                data(1,i) = xos;
                data(2,i) = yos;
                data(3,i) = zos;
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
    % writematrix(data,"prac_plocha_maxUhel_21_acc.txt");
    % writematrix(data,"prac_plocha_maxUhel_26_acc.txt");
    % writematrix(data,"prac_plocha_maxUhel_40_acc.txt");
    % writematrix(data,"prac_plocha_tyc_500mm_prim_maxUhel_40.txt");
    %writematrix(data,"prac_plocha_tyc_500mm_prim_maxUhel_40_ver2.txt");
    %writematrix(data,"prac_plocha_tyc_600mm_prim.txt");
    %writematrix(data,"prac_plocha_tyc_500mm.txt");
    %writematrix(data,"prac_plocha_tyc_600mm.txt");
    % writematrix(data,"test.txt");
end
%toc

%vykresleni pracovni plochy
data = readmatrix("prac_plocha_maxUhel_21_acc.txt");

%data2 = readmatrix("prac_plocha_tyc_500mm_prim_maxUhel_20.txt");
view(3);
scatter3(data(1,:),data(2,:),data(3,:),25,'.', 'm', DisplayName="Pracovní plocha");
%hold on
%scatter3(data2(1,:),data2(2,:),data2(3,:),'x', 'b');
xlabel x[mm];
ylabel y[mm];
zlabel z[mm];
title("Pracovni plocha delta robotu pro limitní úhel 21 stupnu");
% 
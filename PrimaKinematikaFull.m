function [x, y, z] = PrimaKinematika(rozmery, natazeni)
    syms x y z
    d1 = rozmery(1); %offset
    d2 = rozmery(2); % rameno
    d3 = rozmery(3); % offset od ramena
    d4 = rozmery(4); %karbon tyc
    d5 = rozmery(5); %offset k konec bodu
    tU = double(natazeni(1)/d2);
    tV = double(natazeni(2)/d2);
    tW = double(natazeni(3)/d2);
    
    %% rovnice primek ramen
    %rameno U
    xU = d1+d3*cosd(45)+tU*d2*sind(45);
    yU = 0;
    zU = -d3*sind(45)+tU*d2*cosd(45);
    %rameno V
    xV = -cosd(60)*(d1+d3*cosd(45)+tV*d2*sind(45));
    yV = -sind(60)*(d1+d3*cosd(45)+tV*d2*sind(45));
    zV = -d3*sind(45)+tV*d2*cosd(45);
    %rameno W
    xW = -cosd(60)*(d1+d3*cosd(45)+tW*d2*sind(45));
    yW = sind(60)*(d1+d3*cosd(45)+tW*d2*sind(45));
    zW = -d3*sind(45)+tW*d2*cosd(45);

    %% rovnice kruznic posunutých o konečný bod u ramen
    %rameno U
    xUk = xU-d5;
    yUk = yU;
    zUk = zU;
    %rameno V
    xVk = xV-(-d5*cosd(60));
    yVk = yV-(-d5*sind(60));
    zVk = zV;
    %rameno W
    xWk = xW-(-d5*cosd(60));
    yWk = yW-(d5*sind(60));
    zWk = zW;
    
    xyz = interxmy([xUk yUk zUk], [xVk yVk zVk],[xWk yWk zWk],d4);
    x = xyz(1);
    y = xyz(2);
    z = xyz(3);

end

fx = 525;
fy = fx;

cx = 312;
cy = 264;

%rozmiar obiektu w px
%distx = 489-392;
% odleglosc obiektu w metrach
%Z = imgDepth(71,447)
% x = fx * X / Z + cx
% x1 - x2 = fx * (X1/Z - X2/Z)
% distx = fx * distX/Z
%distX = distx * Z / fx


x = zeros(size(imgDepth));
y = zeros(size(imgDepth));
z = zeros(size(imgDepth));

for nx=1:size(imgDepth, 2)
    for ny=1:size(imgDepth, 1)
    nx;
    ny;
    
    % x = fx * X / Z + cx
    %x-cx=fx*X/Z
    %X = x-cx*Z/fx
        x(ny,nx) = (nx-cx)*imgDepth(ny,nx)/fx;
        y(ny,nx) = (ny-cy)*imgDepth(ny,nx)/fy;
        z(ny,nx) = imgDepth(ny,nx);
    end
end

% figure(1);
% pcshow([x(:),y(:),z(:)]);
% title('Sphere with Default Color Map');
% xlabel('X');
% ylabel('Y');
% zlabel('Z');

ptCloud = pointCloud([x(:), y(:), z(:)])

%znajdz plaszczyzne stolu
%wykryc sfere, podac jej romiar

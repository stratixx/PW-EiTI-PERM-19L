%rysuje dane z filterRegions
load('BW1.mat');

[BW_out,properties] = filterRegions(BW1);


imshow(imgRGBSmall)

circles = prop(abs(prop(:,4)-prop(:,11))<8, :);

centers = circles(:,2:3);
diameters = mean([circles(:,4), circles(:,5)],2);
radii = diameters/2;
viscircles(centers,radii);


rectangles = prop(abs(prop(:,4)-prop(:,11))>8, :);

points = rectangles(:,2:3);
sizes = ones(size(rectangles,1),2)*10;

for n=1:size(points,1)
    rectangle('Position',[points(n,:) sizes(n,:)]);
end

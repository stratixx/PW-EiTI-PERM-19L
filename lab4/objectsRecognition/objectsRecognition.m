%rysuje dane z filterRegions
load('processedImgBlurRGBSmall.mat');
load('imgRGBSmall.mat');

imshow(imgRGBSmall)

circles = properties(abs([properties.MajorAxisLength]-[properties.EquivDiameter])<8, :);

for n=1:size(circles,1)
    centers = circles(n).Centroid;
    diameters = mean([[circles(n).MajorAxisLength], [circles(n).MinorAxisLength]],2);
    radii = diameters/2;
    viscircles(centers,radii);
    
    % srodek okregu
    viscircles(centers, 0.5, 'Color', 'white'); 
    % krawedz okregu
    viscircles([centers(1)+radii, centers(2)], 0.5, 'Color', 'white'); 
    % kolor obiektu
    color = ([mean(imgRGBSmall(floor(centers(2)-5:1:centers(2)+4),...
                                  floor(centers(1)-5:1:centers(1)+4),:),[1 2])]);
    color = [ color(1), color(2), color(3) ];
    colorName = colornames('Natural',color/255);
    colorName = colorName{1};
    %txt = "Circle"+newline+num2str(color(1))+newline+num2str(color(2))+newline+num2str(color(3));
    txt = "Circle"+newline+colorName;

    
    text(centers(1), centers(2), txt, 'Color', 'green' );
end

rectangles = properties(abs([properties.MajorAxisLength]-[properties.EquivDiameter])>8, :);

for n=1:size(rectangles, 1)
    
    point = rectangles(n).Centroid;
    % wymiary prostokata
    sizes = [rectangles(n).MajorAxisLength rectangles(n).MinorAxisLength];
    
    txt = "";
    if rectangles(n).ConvexArea>2000
        %txt = "not pen"; 
        %nie przetwarzaj nie-dlugopisy
        continue;
    else
        txt = "pen ";
    end
    
    % srodek prostokata
    viscircles(point, 0.5, 'Color', 'white'); 
    % kolor obiektu
    color = ([mean(imgRGBSmall(floor(point(2)-5:1:point(2)+4),...
                                  floor(point(1)-5:1:point(1)+4),:),[1 2])]);
    color = [ color(1), color(2), color(3) ];
    colorName = colornames('Natural',color/255);
    colorName = colorName{1};
    txt = txt+newline+colorName;
    %wierzcholki prostokata
    [rotPoints] = draw_rectangle(point, sizes(1), sizes(2), rectangles(n).Orientation, 'red');
    
    text(point(1), point(2), txt, 'Color', 'blue' );
end

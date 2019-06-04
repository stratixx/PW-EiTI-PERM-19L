%rysuje dane z filterRegions
load('processedImgBlurRGBSmall.mat');

imshow(maskedRGBImage)

circles = properties(abs([properties.MajorAxisLength]-[properties.EquivDiameter])<8, :);

for n=1:size(circles,1)
    centers = circles(n).Centroid;
    diameters = mean([[circles(n).MajorAxisLength], [circles(n).MinorAxisLength]],2);
    radii = diameters/2;
    viscircles(centers,radii);
    
    
    color = ([mean(maskedRGBImage(floor(centers(2)-5:1:centers(2)+4),...
                                  floor(centers(1)-5:1:centers(1)+4),:),[1 2])]);
    
    txt = "Circle";%+newline+num2str(color(1))+newline+num2str(color(2))+newline+num2str(color(3));
    
    
    text(centers(1), centers(2), txt, 'Color', 'green' );
end

rectangles = properties(abs([properties.MajorAxisLength]-[properties.EquivDiameter])>8, :);

for n=1:size(rectangles, 1)
    
    point = rectangles(n).Centroid;
    sizes = [rectangles(n).MajorAxisLength rectangles(n).MinorAxisLength];
    
    txt = "";
    if rectangles(n).ConvexArea>2000
        txt = "not pen"; 
    else
        txt = "pen ";
    end
    
    draw_rectangle(point, sizes(1), sizes(2), rectangles(n).Orientation, 'red');
    text(point(1), point(2), txt, 'Color', 'blue' );
end

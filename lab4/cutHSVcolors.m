% img = blurredImage;

Z = peaks(100) ; 
figure(1)
pcolor(Z)
cmap = hsv ;
colormap(cmap)
% Remove red 
idx = cmap(:,3)==1 ; 
cmap(idx,:) = [] ;
figure(2)
pcolor(Z) 
colormap(cmap)

imgMasked = img;

threshold = mode(img,[1 2]);

imgR = img(:,:,1);
imgG = img(:,:,2);
imgB = img(:,:,3);

threshold(1) = threshold(1);
threshold(2) = threshold(2);
threshold(3) = threshold(3);
offset = 50;

size(img,1)

for n=1:size(img,1)
    n
    
    imgR(n,imgR(n,:)>=(threshold(1)+offset)) = 255;
    imgR(n,imgR(n,:)<=(threshold(1)-offset)) = 255;
    
    imgG(n,imgG(n,:)>=(threshold(2)+offset)) = 255;
    imgG(n,imgG(n,:)<=(threshold(2)-offset)) = 255;
    
    imgB(n,imgB(n,:)>=(threshold(3)+offset)) = 255;
    imgB(n,imgB(n,:)<=(threshold(3)-offset)) = 255;
    
    thresholdIndex = imgR(n,:)<255 & imgG(n,:)<255 & imgB(n,:)<255;

    
    imgR(n,thresholdIndex) = 0;
    imgG(n,thresholdIndex) = 0;
    imgB(n,thresholdIndex) = 0;
    
    
    thresholdIndex = imgR(n,:)==0 & imgG(n,:)==0 & imgB(n,:)==0;
    
    imgMasked(n, thresholdIndex, 1) = 0;
    imgMasked(n, thresholdIndex, 2) = 0;
    imgMasked(n, thresholdIndex, 3) = 0;    
end

imgThreshold = zeros(size(img));

imgThreshold(:,:,1) = imgR;
imgThreshold(:,:,2) = imgG;
imgThreshold(:,:,3) = imgB;


figure(1)
subplot(3,3,1)
imshow(img)
title('original')

subplot(3,3,2)
imshow(imgMasked)
title('Masked')

subplot(3,3,3)
imshow(imgThreshold)
title('Threshold')

subplot(3,3,4)
imshow(img(:,:,1));
title('Red')

subplot(3,3,5)
imshow(img(:,:,2));
title('Green')

subplot(3,3,6)
imshow(img(:,:,3));
title('Blue')

subplot(3,3,7)
imshow(imgR);
title('Red Threshold')

subplot(3,3,8)
imshow(imgG);
title('Green Threshold')

subplot(3,3,9)
imshow(imgB);
title('Blue Threshold')

figure(2)
imshow(imgThreshold)
title('Threshold')

figure(3)
imshow(imgMasked)
title('Masked')
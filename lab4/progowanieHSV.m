
imgMasked = img;

threshold = mode(img,[1 2]);

imgR = img(:,:,1);
imgG = img(:,:,2);
imgB = img(:,:,3);

threshold(1) = threshold(1);
threshold(2) = threshold(2);
threshold(3) = threshold(3);

offset = zeros(3);


size(img,1)

for n=1:size(img,1)
    n
    
    imgR(n,imgR(n,:)>=0.2) = 1;
    %imgR(n,imgR(n,:)<=) = 1;
    
    imgG(n,imgG(n,:)>=1) = 1;
    %imgG(n,imgG(n,:)<=) = 1;
    
    imgB(n,imgB(n,:)>=1) = 1;
    %imgB(n,imgB(n,:)<=1) = 1;
    
    thresholdIndex = imgR(n,:)<1 & imgG(n,:)<1;% & imgB(n,:)<1;

    
    imgR(n,thresholdIndex) = 0;
    imgG(n,thresholdIndex) = 0;
    imgB(n,thresholdIndex) = 0;
    
    
    thresholdIndex = imgR(n,:)==0 & imgG(n,:)==0;% & imgB(n,:)==0;
    
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
imshow(hsv2rgb(img))
title('original')

subplot(3,3,2)
imshow(hsv2rgb(imgMasked))
title('Masked')

subplot(3,3,3)
imshow(hsv2rgb(imgThreshold))
title('Threshold')

subplot(3,3,4)
imshow(img(:,:,1));
title('H')

subplot(3,3,5)
imshow(img(:,:,2));
title('S')

subplot(3,3,6)
imshow(img(:,:,3));
title('V')

subplot(3,3,7)
imshow(imgR);
title('H Threshold')

subplot(3,3,8)
imshow(imgG);
title('S Threshold')

subplot(3,3,9)
imshow(imgB);
title('V Threshold')

figure(2)
imshow(hsv2rgb(imgThreshold))
title('Threshold')

figure(3)
imshow(hsv2rgb(imgMasked))
title('Masked')

imageName = '../prepared/imgBlurRGBSmall.png';

imgRGB = imread(imageName); % read

disp('create mask')
[BW,maskedRGBImage] = createMask(imgRGB);

disp('segment image')
[BW,maskedRGBImage] = segmentImage(maskedRGBImage,BW);

disp('filter regions')
[BW,properties] = filterRegions(BW);

imshow(maskedRGBImage)
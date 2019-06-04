imgName = 'raw/scena2_depth.png';

imgDepth = imread(imgName);

imgDepth = double(imgDepth)./1000;

imshow(imgDepth)
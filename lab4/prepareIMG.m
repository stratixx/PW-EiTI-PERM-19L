
imageName = 'raw/3.jpg';

imgRGB = imread(imageName); % read
imgBlur = blur(imgRGB); % blur

imgRGBSmall = imresize(imgBlur, 0.17);

imgHSVSmall = rgb2hsv(imgRGBSmall);

imgHSVThreshold = HSVThreshold(imgHSVSmall);

imgRGBThreshold = hsv2rgb(imgHSVThreshold);

imshow(imgRGBThreshold); % Display it.

%przydatne skrypty:
%color thresholder
%image segmenter
%image region analyser - wyeksportuj funkcję i sprawdź jakiej metody używa
imageName = 'raw/3.jpg';

rgbImage = imread(imageName); % Sample image.
windowWidth = 45; % Whatever you want.  More blur for larger numbers.
kernel = ones(windowWidth) / windowWidth ^ 2;
blurredImage = imfilter(rgbImage, kernel); % Blur the image.
imshow(blurredImage); % Display it.

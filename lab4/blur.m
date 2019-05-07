imageName = 'raw/3.jpg';

img = imread(imageName); % Sample image.
windowWidth = 45; % Whatever you want.  More blur for larger numbers.
kernel = ones(windowWidth) / windowWidth ^ 2;
img = imfilter(img, kernel); % Blur the image.
imshow(img); % Display it.

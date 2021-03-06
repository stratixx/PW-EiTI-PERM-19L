function [BW,maskedImage] = segmentImage(X)
%segmentImage Segment image using auto-generated code from imageSegmenter App
%  [BW,MASKEDIMAGE] = segmentImage(X) segments image X using auto-generated
%  code from the imageSegmenter App. The final segmentation is returned in
%  BW, and a masked image is returned in MASKEDIMAGE.

% Auto-generated by imageSegmenter app on 21-May-2019
%----------------------------------------------------


% Create empty mask.
BW = false(size(X));

% Flood fill
row = 171;
column = 564;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 277;
column = 674;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 386;
column = 482;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 377;
column = 163;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 188;
column = 310;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 103;
column = 421;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 227;
column = 188;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 185;
column = 233;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 249;
column = 264;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 267;
column = 227;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 301;
column = 321;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 382;
column = 250;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 355;
column = 329;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 393;
column = 300;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 410;
column = 374;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 359;
column = 388;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 369;
column = 430;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 330;
column = 454;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 281;
column = 497;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 247;
column = 405;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 208;
column = 425;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 260;
column = 515;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 450;
column = 586;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 408;
column = 598;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 380;
column = 601;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 423;
column = 592;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 121;
column = 283;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Flood fill
row = 261;
column = 337;
tolerance = 5.000000e-02;
addedRegion = grayconnected(X, row, column, tolerance);
BW = BW | addedRegion;

% Dilate mask with disk
radius = 4;
decomposition = 6;
se = strel('disk', radius, decomposition);
BW = imdilate(BW, se);

% Active contour using Chan-Vese over 100 iterations
iterations = 100;
BW = activecontour(X, BW, iterations, 'Chan-Vese');

% Fill holes
BW = imfill(BW, 'holes');

% Invert mask
BW = imcomplement(BW);

% Invert mask
BW = imcomplement(BW);

% Clear borders
BW = imclearborder(BW);

% Fill holes
BW = imfill(BW, 'holes');

% Create masked image.
maskedImage = X;
maskedImage(~BW) = 0;
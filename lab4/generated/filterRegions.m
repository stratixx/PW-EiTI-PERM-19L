function [BW_out,properties] = filterRegions(BW_in)
%filterRegions  Filter BW image using auto-generated code from imageRegionAnalyzer app.
%  [BW_OUT,PROPERTIES] = filterRegions(BW_IN) filters binary image BW_IN
%  using auto-generated code from the imageRegionAnalyzer App. BW_OUT has
%  had all of the options and filtering selections that were specified in
%  imageRegionAnalyzer applied to it. The PROPERTIES structure contains the
%  attributes of BW_out that were visible in the App.

% Auto-generated by imageRegionAnalyzer app on 21-May-2019
%---------------------------------------------------------

BW_out = BW_in;

% Remove portions of the image that touch an outside edge.
BW_out = imclearborder(BW_out);

% Fill holes in regions.
BW_out = imfill(BW_out, 'holes');

% Filter image based on image properties.
BW_out = bwpropfilt(BW_out, 'Area', [100 + eps(100), Inf]);

% Get properties.
properties = regionprops(BW_out, {'Centroid', 'Area', 'ConvexArea', 'Eccentricity', 'EquivDiameter', 'EulerNumber', 'Extent', 'FilledArea', 'MajorAxisLength', 'MinorAxisLength', 'Orientation', 'Perimeter', 'Solidity'});

% Uncomment the following line to return the properties in a table.
properties = struct2table(properties);

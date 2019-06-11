roi = [0.11, 0.29,-0.39, -0.21, 0.1, 1.5];
% roi = [0.11, 0.29,-0.39, -0.21, 0.72, 0.9];
sampleIndices = ptCloud.findPointsInROI(roi);

maxDistance = 0.05;

[model,inlierIndices] = pcfitsphere(ptCloud,maxDistance,...
            'SampleIndices',sampleIndices);
globe = select(ptCloud,inlierIndices);

hold on;
plot(model);
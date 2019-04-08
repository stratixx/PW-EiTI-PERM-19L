function [val] = patternRecognition(pattern, sample)
% pattern = center{2};
% sample = center{6};
val = 0;

rows = size(pattern, 1);
columns = size(pattern, 2);
valVect = [];

for x=10:columns
   
    val = pattern(:,1:x)-sample(:,columns-x+1:columns);
    val = mean(val.^2);
    
    valVect = [ valVect val ];
end

for x=10:columns
   
    val = sample(:,1:x)-pattern(:,columns-x+1:columns);
    val = mean(val.^2);
    
    valVect = [ valVect val ];
end

val = min(valVect);
% plot(valVect);
% 
% disp(min(valVect))
end


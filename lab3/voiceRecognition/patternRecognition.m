function [val] = patternRecognition(pattern, sample)
% pattern = center{2};
% sample = center{6};
val = 0;

rows = size(pattern, 1);
columns = size(pattern, 2);
valVect = [];

for x=10:columns
%   for y=-100:10:100
    val = pattern(:,1:x)-sample(:,columns-x+1:columns);%+y;
    val = mean(val.^2);
    
    valVect = [ valVect val ];
 %  end
end

for x=10:columns
  % for y=-100:10:100
    val = sample(:,1:x)-pattern(:,columns-x+1:columns);%+y;
    val = mean(val.^2);
    
    valVect = [ valVect val ];
 %  end
end

val = min(valVect);
% plot(valVect);
% 
% disp(min(valVect))
end


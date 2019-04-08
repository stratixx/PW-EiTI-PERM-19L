sample = ord

pattern = center{2};
sample = center{2};

val = zeros(12,12);

for x=1:12
    for y=1:12
        val(x,y) = patternRecognition(center{x}, center{y});
    end
end

mean_ = zeros(3,3);
for x=1:3
    for y=1:3
%        x
%        
%        (x*3-2):(x*3)
%        break;
        mean_(x, y) = mean(mean( val((x*3-2):(x*3), (y*3-2):(y*3)) ));
    end
end
%val(val>1e3) = 1e3;
mesh(1:12,1:12,val)
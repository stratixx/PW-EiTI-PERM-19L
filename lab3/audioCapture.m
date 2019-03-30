disp('Speak into microphone now.')
tic;
audio = [];
order = [];
n = 0;
cale = {};
j = 0;
while toc<8
    n = 0;
    acq = deviceReader();
    audio = [audio, acq'];
    for i = 1:size(acq)
        if abs(acq(i))>minValue
            n = n + 1;
        end
    end
    if n>=minSamples
        order = [order, acq'];
    else
        if size(order,2)>20000
            j = j + 1;
            cale{j}=order;
        end
        order = [];
    end
end
disp('Recording finished.')
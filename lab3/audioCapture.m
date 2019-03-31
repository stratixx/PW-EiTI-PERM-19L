disp('Speak into microphone now.')
tic;
audio = []; %calosc nagrania docelowo do usuniecia
order = []; %bufor na trwajacy rozkaz
n = 0;
orders = {}; %wszystkie rozkazy
j = 0;
framesMinValueN = [];
acqLength = [];
acqData = [];

while toc<20 %docelowo nieskonczona petla
    n = 0;
    acq = deviceReader();
    audio = [audio, acq'];
    for i = 1:length(acq)
        if abs(acq(i))>minValue
            n = n + 1;
        end
    end
    acqData = [acqData, acq];
    framesMinValueN = [framesMinValueN, n];
    if n>=minSamples
        order = [order, acq'];
    else
        if size(order,2)>10000
            j = j + 1;
            orders{j}=order; % docelowo przekazanie do funkcji
        end
        order = [];
    end
end
disp('Recording finished.')
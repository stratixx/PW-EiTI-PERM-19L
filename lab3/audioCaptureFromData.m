load('source/acqRecorded.mat');

audio = []; %calosc nagrania docelowo do usuniecia
order = []; %bufor na trwajacy rozkaz
n = 0;
orders = {}; %wszystkie rozkazy
j = 0;
framesMinValueN = [];
minValue = 200e-4;

for k=1:size(acq') %docelowo nieskonczona petla
    n = 0;
    
    audio = [audio, acq(:, k)'];
    for i = 1:length(acq(:, k))
        if abs(acq(i, k))>minValue
            n = n + 1;
        end
    end
    
    framesMinValueN = [framesMinValueN, n];
    if n>=minSamples
        order = [order, acq(:, k)];
    else
        if size(order,2)>10000
            j = j + 1;
            orders{j}=order; % docelowo przekazanie do funkcji
        end
        order = [];
    end
end

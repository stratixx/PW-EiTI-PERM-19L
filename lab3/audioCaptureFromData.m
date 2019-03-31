%load('source/acqRecordedMarek.mat');
acq = acqData;

audio = []; %calosc nagrania docelowo do usuniecia
order = []; %bufor na trwajacy rozkaz
n = 0;
orders = {}; %wszystkie rozkazy
j = 0;
framesMinValueN = [];
minValue = 40e-4;
noiseTimer = 0;

for k=1:size(acq') %docelowo nieskonczona petla
    n = 0;
    
    audio = [audio, acq(:, k)'];
    for i = 1:length(acq(:, k))
        if abs(acq(i, k))>minValue
            n = n + 1;
        end
    end
    
    framesMinValueN = [framesMinValueN, n];
    
    
    if n>=500 % czy N pr�bek z ramki by�o dostatecznie g�o�ne
        order = [order, acq(:, k)']; 
        noiseTimer = 0;
    elseif noiseTimer < 0.2 % je�li cisza trwa kr�cej ni� okre�lony czas
        noiseTimer = noiseTimer + size(acq(:, k), 1)/Fs;
        order = [order, acq(:, k)'];  
    elseif size(order,2)>Fs*0.3 % czy by�o do�� g�o�no przez okre�lony czas
        j = j + 1;
        orders{j}=order; % docelowo przekazanie do funkcji
        order = [];
        noiseTimer = 0;
            
    end
end

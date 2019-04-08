%disp('Speak into microphone now.')
%load('source/acqRecordedMarek.mat');

audio = zeros(1, 2*Fs); %calosc nagrania docelowo do usuniecia
order = []; %bufor na trwajacy rozkaz
n = 0;
orders = {}; %wszystkie rozkazy
j = 0;
framesMinValueN = [];
minValue = 40e-4;
noiseTimer = 0;
%acqData = [];

for k=1:size(acqData,2) %docelowo nieskonczona petla
    n = 0;
    %acq = deviceReader();
    acq = acqData(:,k);
    audio = [audio, acq'];
    for i = 1:length(acq)
        if abs(acq(i))>minValue
            n = n + 1;
        end
    end
    
    %acqData = [acqData, acq];
    framesMinValueN = [framesMinValueN, n];
    
    
    if n>=500 % czy N próbek z ramki by³o dostatecznie g³oœne
        order = [order, acq']; 
        noiseTimer = 0;
    elseif noiseTimer < 0.4 % jeœli cisza trwa krócej ni¿ okreœlony czas
        noiseTimer = noiseTimer + size(acq, 1)/Fs;
        order = [order, acq'];  
    elseif size(order,2)>Fs*0.5 % czy by³o doœæ g³oœno przez okreœlony czas
        %doklejenie krótkiej chwili sprzed wykrycia g³oœnoœci
        order = [audio(end-length(order)-floor(Fs*0.2):end-length(order)), order];
        
        j = j + 1;
        disp([num2str(j), '. sound detected...']);
        %voiceRecognition(order, Fs);
        orders{j}=order; % docelowo przekazanie do funkcji
        order = [];
        noiseTimer = 0;
            
    end
end

%disp('Recording finished.')

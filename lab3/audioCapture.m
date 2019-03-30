disp('Speak into microphone now.')
tic;
audio = []; %calosc nagrania docelowo do usuniecia
order = []; %bufor na trwajacy rozkaz
n = 0;
orders = {}; %wszystkie rozkazy
j = 0;
while toc<8 %docelowo nieskonczona petla
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
            orders{j}=order; % docelowo przekazanie do funkcji
        end
        order = [];
    end
end
disp('Recording finished.')
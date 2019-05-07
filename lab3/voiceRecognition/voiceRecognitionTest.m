result = {};

for n=1:length(data)
    %soundsc(data{n}, Fs);
    voiceRecognition(data{n}, Fs)
    
    pause(1.5);
end
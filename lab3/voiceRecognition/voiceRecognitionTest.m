result = {};

for n=1:length(orders)
    soundsc(orders{n}, Fs);
    voiceRecognition(orders{n}, Fs)
    
    pause(1.5);
end
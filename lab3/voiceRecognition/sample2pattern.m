
for n=1:length(patterns)
    for k=1:length(patterns(n).sample) 
        n
        k
        %spektogram
        spectrogram_ = mySpectrogram( cell2mat(patterns(n).sample(k)), Fs );
        %wyznaczenie �rodka masy cz�stotliwo�ci
        massCenter_ = massCenter(spectrogram_)
        patterns(n).pattern{k} = massCenter_;
    end
end
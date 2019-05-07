function [command] = voiceRecognition(sample,Fs)
%voiceRecognition Rozpoznawanie komend g�osowych
%usage:  command = voiceRecognition(sample,Fs)
%zwraca napis zawieraj�cy rozpoznan� komend�

%patterns zawiera struktur� z przypisan� komend� tekstowo i g�osowo
load('patternsCuted.mat');
command = '';
scoreThreshold = 1e3;
score=ones(1,length(patterns))*1e10;
%por�wnaj zestaw wzorc�w komend
for n=1:length(patterns)
    %spektogram
    spectrogram_ = mySpectrogram( sample, Fs );
    %wyznaczenie �rodka masy cz�stotliwo�ci
    massCenter_ = massCenter(spectrogram_);
    %por�wnaj ka�dy wzorzec komendy
    score(n) = 0;
    for k=1:length(patterns(n).pattern)   
        score(n) = score(n) + patternRecognition((patterns(n).pattern{k}), massCenter_);
    end
    score(n) = score(n) / length(patterns(n).pattern) ;
end

[scoreSorted scoreIndex] = sort(score);

scoreSorted 
scoreIndex
score = scoreSorted(1);


if(score<scoreThreshold )    
    command = patterns(scoreIndex(1)).text;
end

% mesh(1:length(patterns(n).pattern),1:length(patterns),score)
% xlabel('patterns')
% ylabel('commands')
% zlabel('score')
end


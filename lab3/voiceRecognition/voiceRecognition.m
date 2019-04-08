function [command] = voiceRecognition(sample,Fs)
%voiceRecognition Rozpoznawanie komend g�osowych
%usage:  command = voiceRecognition(sample,Fs)
%zwraca napis zawieraj�cy rozpoznan� komend�

%patterns zawiera struktur� z przypisan� komend� tekstowo i g�osowo
load('patterns.mat');
command = '';
scoreThreshold = 10;
score=[]
%por�wnaj zestaw wzorc�w komend
for n=1:length(patterns)
    %spektogram
    spectrogram_ = mySpectrogram( sample, Fs );
    %wyznaczenie �rodka masy cz�stotliwo�ci
    massCenter_ = massCenter(spectrogram_);
    %por�wnaj ka�dy wzorzec komendy
    for k=1:length(patterns(n).pattern)   
        score(n, k) = patternRecognition(cell2mat(patterns(n).pattern(k)), massCenter_);
    end
%     score = 1;
%     
%     
%     if(score>scoreThreshold)    
%         command = patterns(n).text;
%         break;
%     end
end

[scoreSorted scoreIndex] = sort(mean(score'));

scoreSorted 
scoreIndex

command = patterns(scoreIndex(1)).text;

% mesh(1:length(patterns(n).pattern),1:length(patterns),score)
% xlabel('patterns')
% ylabel('commands')
% zlabel('score')
end


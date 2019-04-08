function [command] = voiceRecognition(sample,Fs)
%voiceRecognition Rozpoznawanie komend g³osowych
%usage:  command = voiceRecognition(sample,Fs)
%zwraca napis zawieraj¹cy rozpoznan¹ komendê

%patterns zawiera strukturê z przypisan¹ komend¹ tekstowo i g³osowo
load('patterns.mat');
command = '';
scoreThreshold = 10;
score=[]
%porównaj zestaw wzorców komend
for n=1:length(patterns)
    %spektogram
    spectrogram_ = mySpectrogram( sample, Fs );
    %wyznaczenie œrodka masy czêstotliwoœci
    massCenter_ = massCenter(spectrogram_);
    %porównaj ka¿dy wzorzec komendy
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


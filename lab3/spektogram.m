% x - sygna� 
% 128 - d�ugo�� okna analizy
% 64 - nak�adanie pomi�dzy kolejnymi oknami
% [] - ilo�� punkt�w FFT na okno (domy�lnie)
% Fs - cz�stotliwo�� pr�bkowania sygna�u
% 'yaxis' - cz�totliwo�ci na osi y, czas na osi x

spectData={};
for n=1:12
figure(n)
spectData{n} =  spectrogram(data{n}, floor(length(data{n})/64), 16, [], Fs, 'yaxis');
%spectData{n} =  spectrogram(data{n}, 100, 32, [], Fs, 'yaxis');

end
close all;
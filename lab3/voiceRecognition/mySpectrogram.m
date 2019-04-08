function [spectrogram_] = mySpectrogram(data, Fs)
% x - sygna� 
% 128 - d�ugo�� okna analizy
% 64 - nak�adanie pomi�dzy kolejnymi oknami
% [] - ilo�� punkt�w FFT na okno (domy�lnie)
% Fs - cz�stotliwo�� pr�bkowania sygna�u
% 'yaxis' - cz�totliwo�ci na osi y, czas na osi x

%figure(1)
spectrogram_ =  spectrogram(data, floor(length(data)/64), 16, [], Fs, 'yaxis');

%close all;
end
%Y = fft(x);     % transformata Fouriera

A = abs(Y);     % amplituda sygna�u
%A = A/L;        % normalizacja amplitudy
%A = A(1:L/2+1); % wyci�cie istotnej cz�ci spektrum
%A(2:end-1) = 2*A(2:end-1);

F = angle(Y);   % faza sygna�u
F = F(1:L/2+1); % wyci�cie istotnej cz�ci spektrum
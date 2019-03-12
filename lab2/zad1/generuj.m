% Parametry systemu
Fs = 1000;     % Cz�stotliwo�� pr�bkowania [Hz]
T = 1/Fs;      % Okres pr�bkowania [s]
L = 1000;      % D�ugo�� sygna�u (liczba pr�bek)
t = (0:L-1)*T; % Podstawa czasu

% Przygotowanie sygna�u
N = 3;               % Liczba sinusoid w mieszaninie
A = [1.0   0.4  0.8] % Amplitudy kolejnych sinusoid
B = [ 15    27   83] % Cz�stotliwo�ci kolejnych sygna��w [Hz]
C = [  0 -pi/3 pi/7] % Przesuni�cia fazowe kolejnych sygna��w


x = zeros(size(t));
for i = 1:N
  x = x + A(i) * cos(2 * pi * B(i) * t + C(i));
end
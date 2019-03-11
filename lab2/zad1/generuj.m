% Parametry systemu
Fs = 1000;     % Czêstotliwoœæ próbkowania [Hz]
T = 1/Fs;      % Okres próbkowania [s]
L = 1000;      % D³ugoœæ sygna³u (liczba próbek)
t = (0:L-1)*T; % Podstawa czasu

% Przygotowanie sygna³u
N = 3;               % Liczba sinusoid w mieszaninie
A = [1.0   0.4  0.8] % Amplitudy kolejnych sinusoid
B = [ 15    27   83] % Czêstotliwoœci kolejnych sygna³ów [Hz]
C = [  0 -pi/3 pi/7] % Przesuniêcia fazowe kolejnych sygna³ów


x = zeros(size(t));
for i = 1:N
  x = x + A(i) * cos(2 * pi * B(i) * t + C(i));
end
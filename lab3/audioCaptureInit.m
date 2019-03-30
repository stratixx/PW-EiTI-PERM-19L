deviceReader = audioDeviceReader('Device', device);
setup(deviceReader);
fileWriter = dsp.AudioFileWriter(...
    'mySpeech.wav',...
    'FileFormat','WAV');
minValue = 2e-05; %ponizej tej wartosci uznawane za szum 
%byc moze do zmiany na innym mikrofonie
minSamples = floor(0.7*deviceReader.SamplesPerFrame);
% jesli 70% ramki to nie szum to moze to byc czesc polecenia
rate = deviceReader.SampleRate;
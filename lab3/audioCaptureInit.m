deviceReader = audioDeviceReader();

disp('Select audio source: ');
devices = deviceReader.getAudioDevices();
for n=1:length(devices)
   disp([num2str(n), ': ', devices{n}]);
end
deviceIndex = input(['deviceIndex[1..', num2str(length(devices)), '] = ']);
deviceReader.Device = deviceReader.getAudioDevices{deviceIndex};

setup(deviceReader);
Fs = deviceReader.SampleRate;
fileWriter = dsp.AudioFileWriter(...
    'mySpeech.wav',...
    'FileFormat','WAV');

minValue = 2e-05; %ponizej tej wartosci uznawane za szum 
%byc moze do zmiany na innym mikrofonie
minSamples = floor(0.7*deviceReader.SamplesPerFrame);
% jesli 70% ramki to nie szum to moze to byc czesc polecenia
rate = deviceReader.SampleRate;
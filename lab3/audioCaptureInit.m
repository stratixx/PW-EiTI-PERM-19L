deviceReader = audioDeviceReader('Device', device);
setup(deviceReader);
fileWriter = dsp.AudioFileWriter(...
    'mySpeech.wav',...
    'FileFormat','WAV');
minValue = 2e-05;
minSamples = floor(0.7*deviceReader.SamplesPerFrame);
rate = deviceReader.SampleRate;
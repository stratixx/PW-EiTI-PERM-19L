device = 'Mikrofon (Realtek High Definition Audio)';
deviceReader = audioDeviceReader('Device', device);
setup(deviceReader);
disp('Speak into microphone now.')
tic;
tst = [];
while toc < 4
    acq = deviceReader();
    tst = [tst, acq'];
end
disp('Recording complete.')
sound(tst, 44100);
release(deviceReader);
disp('Jeœli nagrywanie nie dzia³a zmieñ device na jeden z poni¿szych')
dvs = getAudioDevices(audioDeviceReader);
for i = 1:size(dvs,2)
    disp(dvs(1,i))
end
clear('acq', 'deviceReader', 'tst', 'i', 'dvs');

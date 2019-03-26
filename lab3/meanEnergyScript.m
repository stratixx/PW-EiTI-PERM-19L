meanEnergy = {};

for n=1:12

    meanEnergy{n} = [ abs(mean(spectData{n})) ];
    meanEnergy{n} = meanEnergy{n} / sum(meanEnergy{n});

    figure(n);
    plot(meanEnergy{n}, '.-');
end
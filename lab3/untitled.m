for n=1:12
tmp = data2channel{n};
data{n} = tmp(:,1);
end


%sprawdz DTW - dynamic time warping - porownywania wykresy energii w czasie
%termin 9 kwietnia
%do histogramów - Earth mover

for k=1:length(orders)
    disp(k);
    soundsc(orders{k}, Fs);
    pause(0.7);
end

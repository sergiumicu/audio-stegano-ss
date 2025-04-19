[x, sr] = load_audio('demo_audio/flute.mp3');
datarate = 50;     % using default
prnlength = 1024;  % gps values

prn = make_extended_prn(prnlength, datarate, sr);

signal_spread = make_signal_steg(prn, [-1, 1, -1, 1, -1, -1, 1, -1 ,1]);

y = x';
y(1:length(signal_spread)) = y(1:length(signal_spread)) + .01*signal_spread;

recovered_data = recover_signal_steg(prn, y, "hanning");
stem(recovered_data)
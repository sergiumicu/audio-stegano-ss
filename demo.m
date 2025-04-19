[x, sr] = load_audio('demo_audio/lofi.mp3');
datarate = 5;   % bits per second 
prnlength = 5;  

[ext_prn, prn] = make_extended_prn(prnlength, datarate, sr);

signal_spread = make_signal_steg(ext_prn, ascii2nrz("Hello world!"));

y = x';
y(1:length(signal_spread)) = y(1:length(signal_spread)) + .004*signal_spread;

recovered_data = recover_signal_steg(ext_prn, y, "hanning", true);
stem(recovered_data);

nrz2ascii(recovered_data)
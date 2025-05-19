[x, sr] = load_audio('demo_audio/flute.mp3');
x = x(sr:end);

datarate = 10;   % bits per second 
prnlength = sr/datarate;  
A = 0.01;

prn = make_prn(prnlength);

strotencode = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit\';

signal_spread = make_signal_steg(prn, ascii2nrz(strotencode));
y = x';
y(1:length(signal_spread)) = y(1:length(signal_spread)) + A*signal_spread;
y(length(signal_spread)+1:end) = y(length(signal_spread)+1:end) + A*randn(1, length(x) - length(signal_spread));

recovered_data = recover_signal_steg(prn, y);
recovered_str = nrz2ascii(recovered_data)
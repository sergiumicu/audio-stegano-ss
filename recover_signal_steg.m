function data=recover_signal_steg_better(prn, y)
    [r, K] = xcorr(y, prn);
    
    r = r(K>=0);
    K = K(K>=0);

    data = [];

    for i=1:length(prn):length(y)
        data = [data r(i)];
    end
end
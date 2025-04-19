function seq=make_signal_steg(prn, data)
    lprn = length(prn);
    prn = repmat(prn, 1, length(data));
    data = repelem(data, lprn);

    seq = prn .* data;
end
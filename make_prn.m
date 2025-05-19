function prn=make_prn(prn_length)
    prn = (double(randn(1, prn_length) >= 0) - 0.5) * 2;
end
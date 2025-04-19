function [ext_prn, prn]=make_extended_prn(prn_length, data_rate, original_sample_rate)
    prn = (double(randn(1, prn_length) >= 0) - 0.5) * 2;
    ext_prn = repelem(prn_length, original_sample_rate/data_rate);
end
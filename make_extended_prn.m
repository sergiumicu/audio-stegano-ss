function [ext_prn, prn]=make_extended_prn(prn_length, data_rate, original_sample_rate)
    prn = (double(randn(1, prn_length+1) >= 0) - 0.5) * 2;
    ext_prn = interp1(linspace(0, 1, prn_length+1), prn, linspace(0, 1, original_sample_rate/data_rate+1), 'previous');
    ext_prn = ext_prn(1:end-1);
    prn = prn(1:end-1);
end
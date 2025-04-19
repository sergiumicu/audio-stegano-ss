function data=recover_signal_steg(prn, y, window_type, attempt_truncation)
    if nargin < 3
        window_type = 'hanning';
        attempt_truncation = true;
    elseif nargin < 4 
        if window_type ~= 'hanning' && window_type ~= 'rect'
            error(['Unknown window type ' window_type]);
        end
        attempt_truncation = true;
    end
    

    [r, K] = xcorr(y, prn);
    
    r = r(K>=0);
    K = K(K>=0);

    if window_type == 'hanning'
        r = conv(r, hanning(length(prn)), 'same');
    elseif window_type == 'rect'
        r = conv(r, ones(1, length(prn)), 'same');
    end

    % find datapoint strength and detect if there's no more data
    data = [];

    for i=1:length(prn):length(y)
        if i > 1 && 0.1*abs(data(end)) < abs(r(i))
            data = [data r(i)];
        elseif i == 1
            data = [data r(i)];
        else
            break
        end
    end
end
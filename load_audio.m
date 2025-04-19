function [audio, sample_rate]=load_audio(path)
    [audio, sample_rate] = audioread(path);

    [~, nodim] = size(audio);

    % make mono if stereo
    if nodim == 2
        audio = audio(:, 1) + audio(:, 2); 
    end

    % normalize it
    audio = audio/max(abs(audio));
end
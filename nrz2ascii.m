function ascii=nrz2ascii(nrz)
    nrz = double(nrz>0);
    ascii = [];

    for i=7:7:length(nrz)
        lett = nrz(i-6:i);
        lett = string(lett);
        lett = strjoin(lett, '');
        lett = bin2dec(lett);
        ascii = [ascii char(lett)];
    end

    pos = strfind(ascii, '\');

    for k=pos
        ascii = ascii(1:k-1);
        return;
    end
end
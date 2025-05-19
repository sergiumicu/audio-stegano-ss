function nrz=ascii2nrz(inpstr)
    nrz = [];
    inpstr = char(inpstr);
    inpstr = double(inpstr);
    inpstr = dec2bin(inpstr);
    inpstr = reshape(inpstr', 1, []);
    inpstr = char(inpstr);

    for i=1:length(inpstr)
        nrz = [nrz str2num(inpstr(i))];
    end

    nrz = 2*(nrz - 0.5);
end
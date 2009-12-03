function rBl = st_BinBl(tB, Bl)

%   Example
%   -------
%   tB = unicode2native('A');
%   Bl = magic(3);
%   rBl = st_BinBl(tB, Bl)

teB = dec2bin(tB, 8);
in = 1;

rBl(1, 1) = Bl(1, 1);
for i=1:3
    for j=1:3
        if i == 1 & j == 1, continue; end
        B = Bl(i,j);
        b = str2num(teB(in));
        in = in + 1;
        rB = st_binB(b, B);
        rBl(i, j) = rB;
    end
end
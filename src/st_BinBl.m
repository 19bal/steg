function rBl = st_BinBl(tB, Bl)
%function rBl = st_BinBl(tB, Bl)
%
%st_BinBl tB byte'ini Bl blogu icerisine yerlestir.
%
%   Ornek Kullanim
%   -------
%   FullBlock = st_BinBl(StegoByte, EmpBlock)
%   
%	Sayisal ornek verebilir miyiz?
% 
%   See also st_binB

% $Date: 2009/12/08 16:25 $

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
        rBl(i, j) = rB;%Burada ozyineleme (recursion) mu yapmisiz?
    end
end
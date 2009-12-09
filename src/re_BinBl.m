function tB = re_BinBl(rBl)
%function tB = re_BinBl(rBl)
%
%re_BinBl rBl blogunun icerisine bulunan 1 byte' lik
%gizli veriyi alir ve tB byte' inin icine atarak
%geri dondurur.
%
%   Ornek Kullanim
%   -------
%   tB = unicode2native('A')
%   Bl = magic(3);
%   rBl = st_BinBl(tB, Bl);
%   rB = re_BinBl(rBl)
%   
%   See also st_BinBl, st_binB

% $Date: 2009/12/09 16:25 $

for i=1:3
    for j=1:3
        if i == 1 & j == 1, continue; end
		
		temp = rBl(i, j);%Blogun icindeki 9 kareden sadece biri
        temp = dec2bin(temp, 8);%Karedeki sayiyi binary olarak yaz
		temp2(1,i*3+j) = temp(8);%Binary olarak yazdigin sayinin sadece en son bitini al.
    end
end
tB = uint8(bin2dec(temp2));

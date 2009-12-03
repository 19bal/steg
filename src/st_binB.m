function rB = st_binB(b,B)
%ST_BINB biti (b), Byte (B) sakla
%   ...
%   Example
%   -------
%   rB = st_binB(1, 16)
%   rB = st_binB(0, 17)
% 
%   See also re_binB, st_BinBl, st_TinIm

% $Date: 2009/11/18 16:05 $

if b == 1
    rB = bitor( B, bin2dec('00000001'));
else
    rB = bitand(B, bin2dec('11111110'));
end
    

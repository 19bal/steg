%Emre bunu 08.12.2009 / 15.04 te degistirdi.

function b = re_binB(rB)
%RE_BINB rB icerisinden biti (b) cikart
%   ...
%   Ornek Kullanim
%   -------
%   b = bitand(17, 1)
%   b = bitand(16, 1)
% 
%   See also st_binB, st_BinBl, st_TinIm
% evde degisiklik

% $Date: 2009/11/18 16:25 $

b = bitand(rB, bin2dec('00000001'));


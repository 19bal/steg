function bool = re_varmi(rBl)
% function bool = re_varmi(rBl)
%
% re_varmi, rBl icerisinde (1,1) elemanina bakarak steg bilgi var mi?
%
%   Ornek Kullanim
%   -------
%   Bl = magic(3);
%   rBl = st_BinBl_saklama(Bl);
%   bool = re_varmi(rBl)
%   -------
%   tB = unicode2native('A');
%   Bl = magic(3);
%   rBl = st_BinBl(tB, Bl);
%   bool = re_varmi(rBl)
% 
%   See also st_BinBl_saklama

bool = re_binB(rBl(1, 1));

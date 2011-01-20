function rBl = st_BinBl_saklama(Bl)
% function rBl = st_BinBl_saklama(Bl)
%
% st_BinBl_saklama Bl'un (1,1) elemanini sifir yapar
%
%   Ornek Kullanim
%   -------
%   Bl = magic(3);
%   rBl = st_BinBl_saklama(Bl)
% 
%   See also st_BinBl, re_varmi

rBl = Bl;

rBl(1, 1) = st_binB(0, Bl(1, 1));

function data = Decyrpter(mat)
% function data = Decyrpter(mat)
%
% Gizli veri iceren "mat" matrisi icerisinden, gizlenmis olan veriyi
% cikararak "data" icerisine atar ve bunu dondurur.
%
%   Ornek Kullanim
%   -------
%   data = '19mayis';
%   mat = magic(15);
%   rmat = Encyrpter(mat, data, false);
%   data = Decyrpter(rmat)  
% 
%   See also st_BinBl, st_binB, Encyrpter

% $Date: 2009/12/17 17:15 $


DI = 1;

% BB: Blok Boyutu
BB = 3; 
BBX = BB;
BBY = BB;
[H, W] = size(mat);

% BS: Blok Sayisi
BSX = floor(W / BBX);
BSY = floor(H / BBX);

% 3. her bir blogdan Bayti oku mesaji olustur
% 4. bloklari birlestir
for bX=1:BSX,
    for bY=1:BSY,
        konum.sol = (bX - 1) * BBX + 1;
        konum.sag = konum.sol + BBX - 1;
        konum.ust = (bY - 1) * BBY + 1;
        konum.alt = konum.ust + BBY - 1;
        
        rBl = mat(konum.ust:konum.alt, konum.sol:konum.sag);

        if re_varmi(rBl)
            rB = re_BinBl(rBl);
            
            rchr = native2unicode(rB);
            data(DI) = rchr;
            DI = DI + 1;            
        end        
    end
end
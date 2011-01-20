function rmat = Encyrpter(mat, data)
%function rmat = Encyrpter(mat, data)
% Metin iceren "data" yi, "mat" matrisi icerisine bloklama yapmak suretiyle
% yerlestirerek yeni bir matris ("rmat") uretir ve bunu dondurur.
%
%   Ornek Kullanim
%   -------
%   data = '19mayis';
%   mat = magic(15);
%   rmat = Encyrpter(mat, data);
% 
%   See also st_BinBl, st_binB, Decyrpter

% $Date: 2009/12/17 17:15 $
       
rmat = mat;

% 2. bloklara ayir
% DI: Data Index
% DS: Data Size
%  resmin ilk bloguna mesaj uzunlugunu koy
DS = uint8(length(data));
DI = 1;

% BB: Blok Boyutu
BB = 3; 
BBX = BB;
BBY = BB;
[H, W] = size(mat);

% BS: Blok Sayisi
BSX = floor(W / BBX);
BSY = floor(H / BBX);

% 3. her bir bloga veriden bir Bayt yerlestir
% 4. bloklari birlestir
for bX=1:BSX,
    for bY=1:BSY,       
        konum.sol = (bX - 1) * BBX + 1;
        konum.sag = konum.sol + BBX - 1;
        konum.ust = (bY - 1) * BBY + 1;
        konum.alt = konum.ust + BBY - 1;
        
        Bl = mat(konum.sol:konum.sag, konum.ust:konum.alt);
        
        if bX == 1 && bY == 1,
            tB = DS;
        else
            chr = data(DI);
            tB = unicode2native(chr);
            DI = DI + 1;
        end
        
        rBl = st_BinBl(tB, Bl);
        
        rmat(konum.sol:konum.sag, konum.ust:konum.alt) = rBl;        
        if DI > DS, break; end
    end
    if DI > DS, break; end
end

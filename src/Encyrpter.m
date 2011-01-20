function rmat = Encyrpter(mat, data, dbg)
%function rmat = Encyrpter(mat, data, dbg)
% Metin iceren "data" yi, "mat" matrisi icerisine bloklama yapmak suretiyle
% yerlestirerek yeni bir matris ("rmat") uretir ve bunu dondurur.
%
%   Ornek Kullanim
%   -------
%   data = '19mayis';
%   mat = magic(15);
%   rmat = Encyrpter(mat, data, true);
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

% < OYLAMA MEKANIZMASI
oy = oylama(mat);
[s, syer] = sort(oy(:));
syer = sort(syer(1:DS));
if dbg, syer,   end    
% > OYLAMA MEKANIZMASI

ind = 1;
% 3. her bir bloga veriden bir Bayt yerlestir
% 4. bloklari birlestir
for bX=1:BSX,
    for bY=1:BSY,
        konum.sol = (bX - 1) * BBX + 1;
        konum.sag = konum.sol + BBX - 1;
        konum.ust = (bY - 1) * BBY + 1;
        konum.alt = konum.ust + BBY - 1;
        
        Bl = mat(konum.ust:konum.alt, konum.sol:konum.sag);
         
        if DI <= DS & syer(DI) == ind  % sakla
            if dbg, syer(DI), DI,   end
            
            chr = data(DI);
            tB = unicode2native(chr);
            DI = DI + 1;

            rBl = st_BinBl(tB, Bl);            
        else                % saklama
            rBl = st_BinBl_saklama(Bl);
        end              
        
        rmat(konum.ust:konum.alt, konum.sol:konum.sag) = rBl;        
        ind = ind + 1;
    end
end

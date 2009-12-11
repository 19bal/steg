clc; clear all; close all;

% Algoritma
% 1. sifreli resmi oku
img = imread('st_manzara.bmp');
 
% 2. bloklara ayir
% DI: Data Index
% DS: Data Size
%  resmin ilk blogundan mesaj uzunlugunu oku
DI = 1;

% BB: Blok Boyutu
BB = 3; 
BBX = BB;
BBY = BB;
[H, W] = size(img);

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
        
        rBl = img(konum.sol:konum.sag, konum.ust:konum.alt);
        
        rB = re_BinBl(rBl);
                
        if bX == 1 && bY == 1,
            DS = rB;
        else
            rchr = native2unicode(rB);
            data(DI) = rchr;
            DI = DI + 1;
        end    
        
        if DI > DS, break; end
    end
    if DI > DS, break; end
end
% 5. nihayi mesaji kaydet
dlmwrite('re_mesaj.txt', data, 'delimiter','');
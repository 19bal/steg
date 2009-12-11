clc; clear all; close all;

% Algoritma
% 1. resmi ve veri dosyasini oku
data = textread('mesaj.txt', '%c');
 img = imread('manzara.bmp');
 
% TODO: renkli goruntuye veri saklayacak forma donustur
% Simdilik gri tonajli resimler uzerinde calisalim.
img = rgb2gray(img);           
rimg = img;

% 2. bloklara ayir
% DI: Data Indis
DI = 1;

% BB: Blok Boyutu
BB = 3; 
BBX = BB;
BBY = BB;
[H, W] = size(img);

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
        
        Bl = img(konum.sol:konum.sag, konum.ust:konum.alt);
        
        chr = data(DI);        
        tB = unicode2native(chr);
        rBl = st_BinBl(tB, Bl);
        
        rimg(konum.sol:konum.sag, konum.ust:konum.alt) = rBl;
        DI = DI + 1;
        if DI> size(data), break; end
    end
    if DI> size(data), break; end
end
% 5. nihayi resmi kaydet
imshow(rimg);
imwrite(rimg, 'st_manzara.bmp');

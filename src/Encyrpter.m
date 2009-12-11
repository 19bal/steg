function rimg = Encyrpter(img, data)
%function rimg = Encyrpter(img, data)
%
%Metin iceren "data" yi, "img" resmi icerisine bloklama yapmak suretiyle
%yerlestirerek yeni bir resim ("rimg") uretir ve bunu dondurur.
%
%   Ornek Kullanim
%   -------
%   data = textread('mesaj.txt', '%c');
%   img = imread('manzara.bmp');
%   rimg = Encyrpter(img, data);
%   imshow(rimg);
%   imwrite(rimg, 'st_manzara.bmp');
% 
%   See also st_BinBl, st_binB

% $Date: 2009/12/09 16:25 $

% Algoritma
% 1. resmi ve veri dosyasini oku
% data = textread('mesaj.txt', '%c');
%  img = imread('manzara.bmp');
 
% TODO: renkli goruntuye veri saklayacak forma donustur
% Simdilik gri tonajli resimler uzerinde calisalim.
img = rgb2gray(img);           
rimg = img;

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
        
        if bX == 1 && bY == 1,
            tB = DS;
        else
            chr = data(DI);
            tB = unicode2native(chr);
            DI = DI + 1;
        end
        
        rBl = st_BinBl(tB, Bl);
        
        rimg(konum.sol:konum.sag, konum.ust:konum.alt) = rBl;        
        if DI > DS, break; end
    end
    if DI > DS, break; end
end
% 5. nihayi resmi kaydet
% imshow(rimg);
% imwrite(rimg, 'st_manzara.bmp');

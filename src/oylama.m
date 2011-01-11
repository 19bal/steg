function oy = oylama(mat)
% function oy = oylama(mat)
% 
%   Ornek Kullanim
%   -------
%   mat = magic(15);
%   oy = oylama(mat)
%   [s, ind] = sort(oy(:));
%   % mesaj uzunlugu kadar olanini sec
%   % satir-sutun indislerini hesapla
%   [i, j] = ind2sub([5,5], ind)
%   % satir indisine gore sirala
%   % mesaji yerlestir

% BB: Blok Boyutu
BB = 3; 
BBX = BB;
BBY = BB;
[H, W] = size(mat);

% BS: Blok Sayisi
BSX = floor(W / BBX);
BSY = floor(H / BBX);

for bX=1:BSX,
    for bY=1:BSY,       
        konum.sol = (bX - 1) * BBX + 1;
        konum.sag = konum.sol + BBX - 1;
        konum.ust = (bY - 1) * BBY + 1;
        konum.alt = konum.ust + BBY - 1;
        
        Bl = mat(konum.sol:konum.sag, konum.ust:konum.alt);
   
        fBl = dct2(Bl);
        oy(bX, bY) = zigzag(fBl);
    end
end

function mn_rt = zigzag(fBl)
KATSAYI = [ 0 1 2; ...
            1 2 3; ...
            2 3 4];
fBl = fBl/fBl(1);               % normalizasyon
rate = abs(fBl) .* KATSAYI;
mn_rt = mean(rate(:));


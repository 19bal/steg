function syer = oylama(mat, DS)
% function syer = oylama(mat, DS)
% 
%   Ornek Kullanim
%   -------
%   mat = magic(15);
%   data = '19mayis';
%   syer = oylama(mat, length(data))

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
        
        Bl = mat(konum.ust:konum.alt, konum.sol:konum.sag);
   
        fBl = dct2(Bl);
        oy(bX, bY) = zigzag(fBl);
    end
end

[s, syer] = sort(oy(:));
syer = sort(syer(1:DS));

% HELPER
function mn_rt = zigzag(fBl)
KATSAYI = [ 0 1 2; ...
            1 2 3; ...
            2 3 4];
fBl = fBl/fBl(1);               % normalizasyon
rate = abs(fBl) .* KATSAYI;
mn_rt = mean(rate(:));


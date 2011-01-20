function Data2rgb_normal(ImPath, data, stImPath, renk)
% function Data2rgb_normal(ImPath, data, stImPath, renk)
%
% Icerisine veri gizlenecek olan resim dosyasinin adresini,
% gizlenecek olan veriyi, ve veri gizlenmis olan resmin
% konulacagi adresi alir. Veriyi hedef resmine koyarak
% urettigi sonuc resmini ise ilgili yere kaydeder.
%
%   Ornek Kullanim
%   -------
%   kaynak_resim = 'manzara.bmp';
%   veri = 'omu.edu.tr';
%   hedef_resim = 'sonuc.png';
%   Data2rgb_normal(kaynak_resim, veri, hedef_resim, 1);
%
% Yukaridaki ornek calistirildiktan sonra, calisma dizinimizde,
% icerisine 'omu.edu.tr' verisi gizlenmis olan, 'sonuc.jpg'
% isminde bir resim dosyasi olusacaktir.

dbg = false;
rgb = imread(ImPath);
rgbSonuc = rgb;
rgbEnc = Encyrpter_normal(rgb(:, :, renk), data, dbg);

rgbSonuc(:, :, renk) = rgbEnc;
imwrite(rgbSonuc, stImPath, 'png');

%Veriyi renkli resme nasil gomecegimizi daha sonra belirleyecegiz.

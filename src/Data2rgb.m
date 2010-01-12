function Data2rgb(ImPath, data, stImPath)
% function Data2rgb(ImPath, data, stImPath)
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
%   hedef_resim = 'sonuc.jpg';
%   Data2rgb(kaynak_resim, veri, hedef_resim);
%
% Yukaridaki ornek calistirildiktan sonra, calisma dizinimizde,
% icerisine 'omu.edu.tr' verisi gizlenmis olan, 'sonuc.jpg'
% isminde bir resim dosyasi olusacaktir.

renk = 1;
%Kirmizi icin 1, Yesil icin 2, Mavi icin 3.

rgb = imread(ImPath);
rgbSonuc = rgb;
rgbEnc = Encyrpter(rgb(:, :, renk), data);

rgbSonuc(:, :, renk) = rgbEnc;
imwrite(rgbSonuc, stImPath, 'jpg');

%Veriyi renkli resme nasil gomecegimizi daha sonra belirleyecegiz.

end
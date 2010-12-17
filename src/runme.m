% demo
kaynak_resim = 'manzara.bmp';
veri = 'omu.edu.tr';
hedef_resim = 'sonuc.png';
renk = 1;
%Kirmizi icin 1, Yesil icin 2, Mavi icin 3.

Data2rgb(kaynak_resim, veri, hedef_resim, renk);


figure(1)
    subplot(121),   imshow(kaynak_resim);   title('kaynak');
    subplot(122),   imshow(hedef_resim);    title('hedef');
    
% decrypt

rgb = imread(hedef_resim);
gizli_mesaj = Decyrpter(rgb(:,:,renk))
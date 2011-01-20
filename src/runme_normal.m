% demo
clear all;  close all;  clc;

kaynak_resim = 'manzara.bmp';
veri = '19bal omu.edu.tr';
hedef_resim = 'sonuc.png';
renk = 1;
%Kirmizi icin 1, Yesil icin 2, Mavi icin 3.

tic
Data2rgb_normal(kaynak_resim, veri, hedef_resim, renk);
saklama_suresi = toc

figure(1)
    subplot(121),   imshow(kaynak_resim);   title('kaynak');
    subplot(122),   imshow(hedef_resim);    title('hedef');
    
% decrypt
rgb = imread(hedef_resim);

tic
gizli_mesaj = Decyrpter_normal(rgb(:,:,renk))
restore_suresi = toc
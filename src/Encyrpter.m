clc; clear all; close all;

StegoData = textread('okubeni.txt', '%c');%Gizlenecek olan veriyi okuyoruz.
StegoImage = imread('manzara1.jpg');%Veriyi icinde tutacagimiz resmi okuyoruz.
StegoGray = rgb2gray(StegoImage);%Simdilik gri tonajli resimler uzerinde calisalim.

BlockSize = 3;%Bloklarimiz "BlockSize x BlockSize" ebadinda kucuk matrislerden olusacak.
BlocksInWidth = (size(StegoImage, 2) - mod(size(StegoImage,2), BlockSize))/BlockSize;%Resme soldan saga en fazla kac blok sigdirilabilecegi
BlocksInHeight = (size(StegoImage, 1) - mod(size(StegoImage,1), BlockSize))/BlockSize;%Resme yukaridan asagiya en fazla kac blok sigdirilabilecegi
CurrentBlock = zeros(BlockSize);%Resimden blok okudukca
% dec2bin(uint8(StegoData(2)), 8) %Tek bir karakteri, bir bloga yerlestirirken kullanacagiz.

for i=1:BlocksInHeight%i=1:1 ve j=1:1 yaptigimiz zaman CurrentBlock degeri, resmin sol ust kosesindeki kare matrise esit oluyor, yani duzgun calisiyor.
   for j=1:BlocksInWidth 
       %Burada, "(i-1)*BlocksInWidth + j" degeri, bize kacinci blokta oldugumuzu verecektir.
       CurrentBlock(1:BlockSize, 1:BlockSize) = StegoGray((BlockSize*i - BlockSize + 1):(BlockSize*i), (BlockSize*j - BlockSize + 1):(BlockSize*j));%Siradaki blogu CurrentBlock icerisine kaydet 
       if ((i-1)*BlocksInWidth + j <= size(StegoData, 1))%Gizlenecek verinin uzunlugunu asmamis isek:
          StegoBlock = st_BinBl(dec2bin(uint8(StegoData((i-1)*BlocksInWidth + j)), 8), CurrentBlock);%CurrentBlock' un icerisine 1 byte' lik veri gizleniyor ve StegoBlock blogu elde ediliyor.
          StegoGray((BlockSize*i - BlockSize + 1):(BlockSize*i), (BlockSize*j - BlockSize + 1):(BlockSize*j)) = StegoBlock(1:BlockSize, 1:BlockSize);%Orijinal resim degistiriliyor, veri gomulmus bir resim elde ediliyor.
       end
   end
end
imshow (StegoGray)
clc; clear all; close all;

StegoData = textread('okubeni.txt', '%c');%Gizlenecek olan veriyi okuyoruz.
StegoImage = imread('manzara1.jpg');%Veriyi icinde tutacagimiz resmi okuyoruz.
StegoGray = rgb2gray(StegoImage);%Simdilik gri tonajli resimler uzerinde calisalim.

BlockSize = 3;%Bloklarimiz "BlockSize x BlockSize" ebadinda kucuk matrislerden olusacak.
BlocksInWidth = (size(StegoImage, 2) - mod(size(StegoImage,2), BlockSize))/BlockSize;%Resme soldan saga en fazla kac blok sigdirilabilecegi
BlocksInHeight = (size(StegoImage, 1) - mod(size(StegoImage,1), BlockSize))/BlockSize;%Resme yukaridan asagiya en fazla kac blok sigdirilabilecegi

% dec2bin(uint8(StegoData(2)), 8) %Tek bir karakteri, bir bloga yerlestirirken kullanacagiz.

for i=1:BlocksInHeight
   for j=1:BlocksInWidth
       
   end
end
%imshow (StegoGray)
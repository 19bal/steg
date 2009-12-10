clc; clear all; close all;

% Algoritma
% 1. resmi ve veri dosyasini oku
% 2. bloklara ayir
% 3. her bir bloga veriden bir Bayt yerlestir
% 4. bloklari birlestir
% 5. nihayi resmi kaydet



% % % % Gizlenecek olan veriyi okuyoruz
% % % StegoData = textread('okubeni.txt', '%c');  
% % % % Veriyi icinde tutacagimiz resmi okuyoruz.
% % % StegoImage = imread('manzara1.jpg');
% % % % TODO: renkli goruntuye veri saklayacak forma donustur
% % % % Simdilik gri tonajli resimler uzerinde calisalim.
% % % StegoGray = rgb2gray(StegoImage);           
% % % 
% % % % 1. Bloklarimiz "BlockSize x BlockSize" ebadinda kucuk matrislerden olusacak.
% % % % 2. Resme soldan saga en fazla kac blok sigdirilabilecegi
% % % % 3. Resme yukaridan asagiya en fazla kac blok sigdirilabilecegi
% % % % 4. Resimden blok okudukca
% % % % 5. dec2bin(uint8(StegoData(2)), 8) %Tek bir karakteri, bir bloga
% % % %    yerlestirirken kullanacagiz.
% % % BlockSize = 3;
% % % BlocksInWidth = (size(StegoImage, 2) - mod(size(StegoImage,2), BlockSize))/BlockSize;
% % % BlocksInHeight = (size(StegoImage, 1) - mod(size(StegoImage,1), BlockSize))/BlockSize;
% % % CurrentBlock = zeros(BlockSize);
% % % 
% % % % i=1:1 ve j=1:1 yaptigimiz zaman CurrentBlock degeri, resmin sol ust
% % % % kosesindeki kare matrise esit oluyor, yani duzgun calisiyor.
% % % for i=1:BlocksInHeight 
% % %    for j=1:BlocksInWidth 
% % %         % Burada, "(i-1)*BlocksInWidth + j" degeri, bize kacinci blokta oldugumuzu 
% % %         % verecektir.       
% % %        CurrentBlock(1:BlockSize, 1:BlockSize) = StegoGray((BlockSize*i - BlockSize + 1):(BlockSize*i), (BlockSize*j - BlockSize + 1):(BlockSize*j));%Siradaki blogu CurrentBlock icerisine kaydet 
% % %        if ((i-1)*BlocksInWidth + j <= size(StegoData, 1))%Gizlenecek verinin uzunlugunu asmamis isek:
% % %           StegoBlock = st_BinBl(dec2bin(uint8(StegoData((i-1)*BlocksInWidth + j)), 8), CurrentBlock);%CurrentBlock' un icerisine 1 byte' lik veri gizleniyor ve StegoBlock blogu elde ediliyor.
% % %           StegoGray((BlockSize*i - BlockSize + 1):(BlockSize*i), (BlockSize*j - BlockSize + 1):(BlockSize*j)) = StegoBlock(1:BlockSize, 1:BlockSize);%Orijinal resim degistiriliyor, veri gomulmus bir resim elde ediliyor.
% % %        end
% % %    end
% % % end
% % % imshow (StegoGray)
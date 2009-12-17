function Data2rgb(impath, data)

rgb = imread(impath);
rgbEnc = Encyrpter(rgb(:, :, 1), data);

%Veriyi renkli resme nasil gomecegimizi daha sonra belirleyecegiz.

end
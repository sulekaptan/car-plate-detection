%close all;
clear all;

im = imread("images/resim13.jpg"); %yolu verilen dosyayı okur
figure 
imshow(im), title("orijinal resim"); %resmi görüntüler
imgray = rgb2gray(im); %resmi gri tonlamalı görüntüye dönüştürür
figure
imshow(imgray), title("griye dönüştürülmüş hali")
imbin = imbinarize(imgray); %gri tonlamalı görüntüden ikili bir görüntü oluşturur
figure
imshow(imbin), title("binary dönüştürülmüş hali");
imgraynew = medfilt2(imgray);  %görüntüyü medyan filtreler
figure
imshow(imgraynew), title("medyan filtrelenmiş hali")
im = edge(imgraynew, 'sobel'); %sobel kenar algılama ile kenarları algılar
figure
imshow(im), title("sobel filtrelenmiş hali");

im = imdilate(im, strel('diamond', 2)); %gri tonlamalı veya ikili görüntüyü genişletir
figure
imshow(im), title("kenarları genişlemiş hali")

im2 = imfill(im,'holes'); %ikili görüntüdeki boşlukları doldurur
figure
imshow(im2), title("dikdörtgen alanları doldurma");
im = imopen(im, strel('rectangle', [2 2])); %ikili görüntü üzerinde dikdörtgen şeklinde morfolojik açma yapar

Iprops = regionprops(im,'BoundingBox','Area','Image'); %ikili görüntüdeki her 8 bağlantılı bileşen için verilen özellikler için ölçümleri verir
area = Iprops.Area;
count = numel(Iprops);
maxa = area;
boundingBox = Iprops.BoundingBox;

for i = 1 : count
    if maxa < Iprops(i).Area
        maxa = Iprops(i).Area;
        boundingBox = Iprops(i).BoundingBox;
    end
end


im = imcrop(imbin, boundingBox); %görüntüyü kırpar
figure
imshow(im), title("plaka tespiti");
im = bwareaopen(~im,500); %500 pikselden az bileşenleri görüntüden kaldırır
figure
imshow(im), 

[h , w] = size(im);

Iprops = regionprops(im,'BoundingBox','Area','Image');
count = numel(Iprops);
noPlate = [ ];


for i = 1 : count
    ow = length(Iprops.Image(1,:));
    oh = length(Iprops.Image(:,1));
    if ow < (h/2) & oh > (h/3)
        letter = letterDetect(Iprops(i).Image); %resme karşılık gelen harfi okur
        noPlate = [noPlate letter];
    end
end
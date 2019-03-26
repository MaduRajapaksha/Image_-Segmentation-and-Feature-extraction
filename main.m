clc;
close all;
clear;

I = imread('rice.png');
%I = rgb2gray(I);
I2 = Thresholding(I);
%imshow(I2);
cc = bwconncomp(I2,8);
n = cc.NumObjects;

Area = zeros(n,1);
Perimeter = zeros(n,1);
MajorAxis = zeros(n,1);
MinorAxis = zeros(n,1);

k = regionprops(cc,'Area','Perimeter','MajorAxis','MinorAxis');

for i = 1:n
    grain = false(size(I2));
    grain(cc.PixelIdxList{i}) = true;
    figure(i);
    imshow(grain);
    Area(i) = k(i).Area;
    Perimeter = k(i).Perimeter;
    MajorAxis = k(i).MajorAxisLength;
    MinorAxis = k(i).MinorAxisLength;
end

graindata(1,1) = mean(Area);
graindata (2,1) = mean(Perimeter);
graindata(3,1) = mean(MajorAxis);
graindata(4,1) = mean(MinorAxis);


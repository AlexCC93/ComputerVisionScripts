clc; clear;
%% Open image
originalImage = imread('imageTest3.jpg');
subplot(2,2,1);
imshow(originalImage), title('Original Image');

%% Binarize image
[m,n,o]=size(originalImage);
im_red=originalImage(:,:,1);
im_blue=originalImage(:,:,2);
im_green=originalImage(:,:,3);
Uinf1=100;
Usup1=255;
Uinf2=2;
Usup2=70;
Uinf3=2;
Usup3=60;
imRes=zeros(m,n);
for i=1:m
    for j=1:n
        if((im_red(i,j)>Uinf1 && im_red(i,j)<Usup1)&&im_blue(i,j)>Uinf2 && im_blue(i,j)<Usup2&&im_green(i,j)>Uinf3 && im_green(i,j)<Usup3)
            imRes(i,j)=1;
        end
    end
end
subplot(2,2,2);
imshow(imRes), title('Binarized Image');

se=strel('disk',20);
imRes=imclose(imRes,se);
subplot(2,2,3);
imshow(imRes), title('Dilated Image');


%% Find the center of the object (circles)
%---- Find edge of the image
cannyEdges=edge(imRes,'canny',0.15);
subplot(2,2,4);
imshow(cannyEdges), title('Canny edges');

%---- Find the centers of the objects
[centers, radii] = imfindcircles(cannyEdges,[15 30]);
size(centers)
viscircles(centers, radii,'EdgeColor','b');
impixelinfo()

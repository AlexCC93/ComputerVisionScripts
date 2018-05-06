%% Gaussian filter recommended
im=imread('Pinguino.jpg');
subplot(2,2,1);
imshow(im), title('Original image');
sigma=5;
Iblur = imgaussfilt(im,sigma);
% Iblur = imgaussfilt(im,sigma,'FilterSize',[5 9]); %It is possible to add 
            %this filterSize parameter
subplot(2,2,2);
imshow(Iblur), title('Recomended Gaussian filtered image');


%% Comparisson the gaussian filter recommended vs the previous one
im=imread('Pinguino.jpg');
subplot(3,2,1);
imshow(im);
title('Original image');
hsize=21;
sigma=10;
h=fspecial('gaussian',hsize,sigma)
outim=imfilter(im,h);%assumes the boundaries values to be 0.
subplot(3,2,2);
imshow(outim);
title('Gaussian filtered image');
outim2=imfilter(im,h,'circular');%computes with some values out of the boundaries
subplot(3,2,3);
imshow(outim2);
title('With circular parameter');
outim3=imfilter(im,h,'replicate');%%values outside the bounds assumed to be equal the
            %the nearest input array.
subplot(3,2,4);
imshow(outim3);
title('With replicate parameter');
sigma=10;
Iblur = imgaussfilt(im,sigma,'FilterSize',21);
subplot(3,2,5);
imshow(Iblur), title('Gaussian filtered image recommended');
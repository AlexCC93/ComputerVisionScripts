%% Otsus binarization method
img =imread('bimodal1.jpg');
% size(img)
subplot(2,2,1);
imshow(img), title('Original image');
mono=rgb2gray(img);
subplot(2,2,2);
imshow(mono), title('Grayscale image');
T = graythresh(mono);
BW = imbinarize(mono,T);
subplot(2,2,3);
imshow(BW), title('Binarized Otsu image');
BW2 = imbinarize(mono);
subplot(2,2,4);
imshow(BW2), title('Binarized Otsu image 2');


%% Otsus binarization method VS adaptive thresholding
img =imread('thresholdingImage.jpg');
% size(img)
subplot(2,2,1);
imshow(img), title('Original image');
mono=rgb2gray(img);
subplot(2,2,2);
imshow(mono), title('Grayscale image');
T = graythresh(mono)
BW = imbinarize(mono,T);
subplot(2,2,3);
imshow(BW), title('Binarized Otsu image');
T2 = adaptthresh(mono, 0.64);
BW2 = imbinarize(mono,T2);
subplot(2,2,4);
imshow(BW2), title('Adaptive Binarized image');


%% Adaptive vs global vs otsus
img =imread('thresholdingImage.jpg');
% size(img)
subplot(2,2,1);
imshow(img), title('Original image');

mono=rgb2gray(img);
subplot(2,2,2);
T = graythresh(mono);
BW = imbinarize(mono,T);
imshow(BW), title('Otsu binarized image');

subplot(2,2,3);
T2 = adaptthresh(mono, 0.64);
BW2 = imbinarize(mono,T2);
imshow(BW2), title('Adaptive binarized image');

subplot(2,2,4);
% BW3 = imbinarize(mono,0.45);%the second parameter is a number from 0 to 1, 
        %this is because mono is of type uint8, converting it to double
        %will result in introducing a number from 0 to 255 as the second 
        %value parameter 
BW3 = imbinarize(double(mono),128);
imshow(BW3), title('Global binarized image');

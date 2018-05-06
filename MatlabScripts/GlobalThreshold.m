%% Global threshold method
img =imread('thresholdingImage.jpg');
% size(img)
subplot(2,2,1);
imshow(img), title('Original image');
mono=rgb2gray(img);
subplot(2,2,2);
imshow(mono), title('Grayscale image');
BW = imbinarize(mono,0.5);
subplot(2,2,3);
imshow(BW), title('Global threshold image');
T2 = adaptthresh(mono, 0.64);
BW2 = imbinarize(mono,T2);
subplot(2,2,4);
imshow(BW2), title('Adaptive threshold image');
impixelinfo()
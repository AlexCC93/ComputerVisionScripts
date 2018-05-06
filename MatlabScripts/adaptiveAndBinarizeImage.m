%% AdaptiveAndBinarizeImage
img =imread('plateNumber3.jpg');
% size(img)
subplot(2,2,1);
imshow(img), title('Original image');
mono=rgb2gray(img);
subplot(2,2,2);
imshow(mono), title('Grayscale image');
T = adaptthresh(mono, 0.68);
BW = imbinarize(mono,T);
subplot(2,2,3);
imshow(BW), title('Binarized image');
impixelinfo()

%% AdaptiveAndBinarizeImage changing adapatthresh value
img =imread('thresholdingImage.jpg');
% size(img)
subplot(2,2,1);
imshow(img), title('Original image');
mono=rgb2gray(img);
subplot(2,2,2);
imshow(mono), title('Grayscale image');
T = adaptthresh(mono, 0.58);
BW = imbinarize(mono,T);
subplot(2,2,3);
imshow(BW), title('Binarized image');
impixelinfo()
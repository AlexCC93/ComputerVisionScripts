img =imread('coloredCircles.png');
% size(img)
subplot(2,2,1);
imshow(img), title('Original image');
mono=rgb2gray(img);
subplot(2,2,2);
imshow(mono), title('Grayscale image');
noisyImage=imnoise(mono,'salt & pepper',0.02);
subplot(2,2,3);
imshow(noisyImage), title('Noisy image');
K = medfilt2(noisyImage);
subplot(2,2,4);
imshow(K ), title('Medfilt2 applied');

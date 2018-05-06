%%Median filter
im = imread('Albert Einstein.jpg');
subplot(2,2,1);
imshow(im);
title('Original')
J = imnoise(im,'salt & pepper',0.02);
subplot(2,2,2);
imshow(J);
title('Salt and pepper noise')
filteredImage = medfilt2(J);
subplot(2,2,3);
imshow(filteredImage);
title('Filtered image')

%% Canny edge detection with filter and no filter
img = imread('Leena.jpg');
subplot(2,2,1);
imshow(img);
title('Original image')
mono=rgb2gray(img);
img2=edge(mono,'canny');
subplot(2,2,2);
imshow(img2);
title('Canny applied')
h=fspecial('gaussian',[11 11],4);
smoothedImg=imfilter(mono,h);
subplot(2,2,3);
imshow(smoothedImg);
title('Gaussian filter applied')
img3=edge(smoothedImg,'canny');
subplot(2,2,4);
imshow(img3);
title('Canny applied over the filtered image')


%% Canny and log edge detection 
img = imread('Leena.jpg');
subplot(2,2,1);
imshow(img);
title('Original image')
mono=rgb2gray(img);
h=fspecial('gaussian',[11 11],4);
smoothedImg=imfilter(mono,h);
subplot(2,2,2);
imshow(smoothedImg), title('Gaussian filter applied')
img3=edge(smoothedImg,'canny');
subplot(2,2,3);
imshow(img3), title('Canny applied over the filtered image')
logEdges=edge(smoothedImg,'log');
subplot(2,2,4);
imshow(logEdges), title('Log edges');


%% Diferent techniques for edge detection
% Open the image, convert it to monochrome and applying gaussian filter to
% it
img =imread('Leena.jpg');
subplot(2,2,1);
imshow(img), title('Original image');
mono=rgb2gray(img);
subplot(2,2,2);
imshow(mono), title('Monochrome image');
h=fspecial('gaussian',[11 11],4);
subplot(2,2,3);
surf(h), title('plotted gaussian kernel');
smoothedImg=imfilter(mono,h);
subplot(2,2,4);
imshow(smoothedImg), title('smoothed image');

%% Method 1: Shift left and right, and show diff image
smoothCopyL=smoothedImg;
smoothCopyL(:,[1:(end-1)])=smoothCopyL(:,[2:end]);
smoothCopyR=smoothedImg;
smoothCopyR(:,[2:(end)])=smoothCopyR(:,[1:(end-1)]);
diff=double(smoothCopyR) - double(smoothCopyL);
figure;
subplot(2,2,1);
imshow(diff,[]), title('Difference between left and right images');

%% Method 2: Canny edge detector
cannyEdges=edge(mono,'canny');
subplot(2,2,2);
imshow(cannyEdges), title('Canny edges');
cannyEdges2=edge(smoothedImg,'canny');
subplot(2,2,3);
imshow(cannyEdges2), title('Canny edges on the smoothed image');

%% Method 3: Laplacian of Gaussian
logEdges=edge(mono,'log');
subplot(2,2,4);
imshow(logEdges), title('Log edges on the monochromatic image');
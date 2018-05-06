%% Erosion of two images
img =imread('neymar.jpg');
size(img)
subplot(2,2,1);
imshow(img), title('Original image');
%Creating the structural element and applying
se = strel('square',10)
erodedBW = imerode(img,se);
subplot(2,2,2);
imshow(erodedBW), title('Eroded image');
%Reading a new image
img2 =imread('imageToErodeAndDilate.png');
subplot(2,2,3);
imshow(img2), title('Original image 2');
%Creating a different structural element and applying
se2 = strel('line',5,45);
erodedBW2 = imerode(img2,se2);
subplot(2,2,4);
imshow(erodedBW2), title('Eroded image 2');

%% Dilation 
img =imread('neymar.jpg');
size(img)
subplot(2,2,1);
imshow(img), title('Original image');

se = strel('line',7,20)
dilatedImg = imdilate(img,se);
subplot(2,2,2);
imshow(dilatedImg), title('Dilated image');

img2 =imread('imageToErodeAndDilate.png');
subplot(2,2,3);
imshow(img2), title('Original image 2');

se2 = strel('line',4,45);
dilatedImg2 = imdilate(img2,se2);
subplot(2,2,4);
imshow(dilatedImg2), title('Dilated image 2');


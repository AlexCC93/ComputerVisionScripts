%%Images with color
im=imread('Mona Lisa.jpg');
disp(size(im));
subplot(2,2,1);
imshow(im);
redChannel = im(:,:,1);
disp(size(redChannel));
subplot(2,2,2);
imshow(redChannel);
greenChannel = im(:,:,2);
subplot(2,2,3);
imshow(greenChannel);
subplot(2,2,4);
plot(redChannel(1,:))
% blueChannel = im(:,:,3);
% subplot(2,2,4);
% imshow(blueChannel);
impixelinfo()

%% Add 2 images
im=imread('Pinguino.jpg');
disp(size(im));
subplot(2,2,1);
imshow(im);
im2=imread('Ugly cat.jpg');
disp(size(im2));
subplot(2,2,2);
imshow(im2);
addedImg=im/2+im2/2;
subplot(2,2,3);
imshow(addedImg);
addedImg2=(im+im2)/2;
subplot(2,2,4);
imshow(addedImg2);
impixelinfo()

%% Multiply by a scalar
im=imread('Pinguino.jpg');
disp(size(im));
subplot(2,2,1);
imshow(im);
img2=multiplyFunction(im,0.25);
subplot(2,2,2);
imshow(img2);
impixelinfo()




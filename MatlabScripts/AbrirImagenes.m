%% Taking the 3 channels out of an image
im=imread('Mona Lisa.jpg');%cargar imagen
imred = im(:,:,1);
imgreen = im(:,:,2);
imblue = im(:,:,3);
subplot(2,2,1);
imshow(im)
title('Original image')
subplot(2,2,2);
imshow(imred)
title('Red values of the image')
subplot(2,2,3);
imshow(imgreen)
title('Green values of the image')
subplot(2,2,4);
imshow(imblue)
title('Cambio')

%% drawing a line within a picture
% im=imread('Mona Lisa.jpg');
% imgreen = im(:,:,2);
% subplot(1,2,1)
% imshow(imgreen)
% line([1,183],[5,5],'color','r');
% subplot(1,2,2)
% plot(imgreen(85,:));

%% drawing a line within a picture V2.0
% im=imread('Mona Lisa.jpg');
% subplot(1,2,1)
% imshow(im)
% line([1,183],[5,5],'color','r');%draws a line along the 5th row from the 1st to the 183th column
% subplot(1,2,2)
% plot(im(85,:));%show each of the pixel value of the entire 85th row
% impixelinfo

%% size of an image
% im=imread('Albert Einstein.jpg');
% imshow(im)
% disp(size(im));
% disp(class(im));
% disp(im(50:52,50:53));

%% crop images
im=imread('Albert Einstein.jpg');
subplot(1,2,1);
imshow(im)
disp(size(im));
croped=im(10:350,20:450);%im(initialRow:finalRow, intialColmn:finalColmn)
% croped=im(10:350,150:300)%im(initialRow:finalRow, intialColmn:finalColmn)
subplot(1,2,2);
imshow(croped)
impixelinfo()



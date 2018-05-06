%% Calculate Gradient Magnitude and Direction
% Using Prewitt Method
I = imread('neymar.jpg');
subplot(2,2,1);
imshow(I), title('Original image');

grayScaleImage = rgb2gray(I);
subplot(2,2,2);
imshow(grayScaleImage), title('Grayscale image');

[Gmag, Gdir] = imgradient(grayScaleImage,'prewitt');
subplot(2,2,3);
imshow(Gmag,[]), title('Magnitude of the gradient using prewitt method');
subplot(2,2,4);
imshow(Gdir,[]), title('Direction of the gradient using prewitt method');
% figure
% imshowpair(Gmag, Gdir, 'montage'); % shows the two previos images in one section

%% Calculate Gradient Magnitude and Direction 
% Using Directional Gradients (Sobel method)
I = imread('neymar.jpg');
subplot(2,2,1);
imshow(I), title('Original image');

grayScaleImage = rgb2gray(I);
subplot(2,2,2);
imshow(grayScaleImage), title('Grayscale image');

[Gx, Gy] = imgradientxy(grayScaleImage);%returns the directional gradients
    %Gx and Gy.
subplot(2,2,3);
imshowpair(Gx, Gy, 'montage'), title('Gx(left) and Gy(right)')


[Gmag, Gdir] = imgradient(Gx, Gy);%returns the magnitude of the gradient and
    %its direction upon the directonal gradients previously founded. The 
    %default method is Sobel.
subplot(2,2,4);
imshowpair(Gmag, Gdir, 'montage'), title('Gradient magnitude (left), Gradient direction (right)')


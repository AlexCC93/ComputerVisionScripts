%% the average filter, mean filter.
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
h=fspecial('average',3);
K = filter2(h,noisyImage)/255; % it is divided because otherwise it will 
                %output full white. K is now of type double and to show the 
                %grayscale image, its values must be scaled to 1 being
                %white and 0 being black.
subplot(2,2,4);
% imshow(K), title('Average filter applied');
imshow(K, []), title('Average filter applied');%could also be possible without 
                    %dividing by 255.


%% Trying different sizes of h.
img =imread('coloredCircles.png');
size(img)
subplot(2,2,1);
imshow(img), title('Original image');
mono=rgb2gray(img);
subplot(2,2,2);
imshow(mono), title('Grayscale image');
noisyImage=imnoise(mono,'salt & pepper',0.02);
subplot(2,2,3);
imshow(noisyImage), title('Noisy image');
h=fspecial('average',11);
K = filter2(h,noisyImage)/255;
subplot(2,2,4);
imshow(K), title('Average filter applied');

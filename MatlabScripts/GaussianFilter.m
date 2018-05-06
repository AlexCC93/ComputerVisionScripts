%% Applying gaussian filter
im=imread('Pinguino.jpg');
subplot(2,2,1);
imshow(im), title('Original image');
hsize=21;
sigma=4;
h=fspecial('gaussian',hsize,sigma);
subplot(2,2,2);
surf(h), title('the Gaussian graphic');%the surf function plots a 3D graphic 
            % of a given matrix.
subplot(2,2,3);
imagesc(h),title('the Gaussian kernel'); %imagesc scale the values in h to 
            %get the maximum of it as a white color and the minimum as a
            %black color.
%  imshow(h,[]),title('the Gaussian kernel'); %This is shown in black and
            %  white.
outim=imfilter(im,h);
subplot(2,2,4);
imshow(outim),title('filtered image');

%% Another test
im=imread('Pinguino.jpg');
subplot(2,2,1);
imshow(im);
title('Original image');
hsize=21;
sigma=10;
h=fspecial('gaussian',hsize,sigma)%assumes the values boundaries to 0.
outim=imfilter(im,h);
subplot(2,2,2);
imshow(outim);
title('Gaussian filtered image');
outim2=imfilter(im,h,'circular');%%computes with some values out of the boundaries
subplot(2,2,3);
imshow(outim2);
title('With circular parameter');
outim3=imfilter(im,h,'replicate');%%values outside the bounds assumed to be equal the
            %the nearest input array.
subplot(2,2,4);
imshow(outim3);
title('With replicate parameter');
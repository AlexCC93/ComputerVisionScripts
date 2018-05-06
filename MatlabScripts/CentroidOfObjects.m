clc; clear;
%% Open image
originalImage = imread('imageTest3.jpg');
subplot(2,2,1);
imshow(originalImage), title('Original Image');

%% Binarize image
[m,n,o]=size(originalImage);
im_red=originalImage(:,:,1);
im_blue=originalImage(:,:,2);
im_green=originalImage(:,:,3);
%These threshold values were taken with photoshop.
Uinf1=100; %minimum threshold value for red channel
Usup1=255; %maximum threshold value for red channel
Uinf2=2;   %these are for the green channel 
Usup2=70;   
Uinf3=2;    %these are for the blue channel
Usup3=60;
imRes=zeros(m,n);
for i=1:m
    for j=1:n
        if((im_red(i,j)>Uinf1 && im_red(i,j)<Usup1)&&im_blue(i,j)>Uinf2 && ...
                im_blue(i,j)<Usup2&&im_green(i,j)>Uinf3 && im_green(i,j)<Usup3)
            imRes(i,j)=1;
        end
    end
end
subplot(2,2,2);
imshow(imRes), title('Binarized Image');

se=strel('disk',20);
imRes=imclose(imRes,se);
subplot(2,2,3);
imshow(imRes), title('Dilated Image');

%% Objects detection
imageLabeled=bwlabel(imRes); %returns a labeled matrix, identifying in this
        %case the four different elements.
subplot(2,2,4);
imshow(label2rgb(imageLabeled)), title('Objects detected');
% imshow(imageLabeled), title('Objects detected'); %showing the labeled values
        % for the four different regions detected.
objectsProperties=regionprops(imageLabeled); %take the region properties for 
        % each of the detected sectors.

%% Draw a rectangle on the detected objects
for i=1:length(objectsProperties)
    box=objectsProperties(i).BoundingBox;
    rectangle('Position',[box(1),box(2),box(3),box(4)],...
    'EdgeColor','r','LineWidth',3)
end

%% Draw the centroids of the detected objects
for k=1:length(objectsProperties)
    centroidOfObject=objectsProperties(k).Centroid   
    hold on;
    plot(uint8(centroidOfObject(1)),uint8(centroidOfObject(2)), 'g+', 'markersize', 16);
    hold off;
end
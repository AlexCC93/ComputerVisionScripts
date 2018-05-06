%% imFindCircles() function test, read image
img =imread('coloredCircles.png');
% size(img)
subplot(2,2,1);
imshow(img), title('Original image');
%% Change to grayscale
mono=rgb2gray(img);
subplot(2,2,2);
imshow(mono), title('Grayscale image');
%% Applying the imfindcircles function
%changing the object polarity to dark and increasing the sensitivity for
%this particular example in order to detect the circles.
[centers, radii] = imfindcircles(mono,[20 25],'ObjectPolarity','dark','Sensitivity',0.92);
subplot(2,2,3);

% [centers, radii] = imfindcircles(mono,[20 25]); %Thi is without changing
% the object polarity. None of the circles were found.
% subplot(2,2,3);

imshow(mono), title('without the twostage method');
viscircles(centers,radii,'Color','r');
%changing to the two stage method.

[centers2, radii2] = imfindcircles(mono,[20 25], 'ObjectPolarity','dark', 'Sensitivity',0.92,'Method','twostage');
subplot(2,2,4);

% [centers2, radii2] = imfindcircles(mono,[20 25],'Method','twostage');
% %Without changing the object polarity, and using the 'twostage' method. A
% %few circles were detected.
% subplot(2,2,4);

imshow(mono), title('with the two stage method');
viscircles(centers2,radii2,'Color','b');

%% Applying imfindcircles again to detect the non-detected circles
%changing the object polarity to bright in order to detect the yellow circles.
[centersBright, radiiBright] = imfindcircles(img,[20 25], 'ObjectPolarity',...
    'bright', 'Sensitivity',0.92,'Method','twostage'); % notice it can also
        %work with the original image and not necessary with the grayscale
        %image.
figure()
subplot(2,2,1);
imshow(img), title('detecting the yellow circles');
viscircles(centersBright,radiiBright,'Color','b');

%% changing the treshold value in order to detect more circles.

[centersBright2, radiiBright2, metricBright] = imfindcircles(img,[20 25],...
    'ObjectPolarity','bright','Sensitivity',0.92,'EdgeThreshold',0.1);
subplot(2,2,2);
imshow(img), title('changing the Threshold parameter');
viscircles(centersBright2,radiiBright2,'Color','g');
viscircles(centers2,radii2,'Color','b');


%% Reading the image
tablet = imread('tablet.png');
% disp(size(tablet));
subplot(2,2,1);
imshow(tablet);
title('Orignial image');
%% Cut the portion of interest (the template)
glyph = tablet(75:165, 150:185);
subplot(2,2,2);
imshow(glyph);
title('Template image');
% disp(size(glyph));

%% Find the template
c=normxcorr2(glyph,tablet);
%max(c) returns a vector containing the maximum values in every column 
%of the c matrix.
%c(:) converts all the values contained in c into one single column vector
%max(c(:)) returns just one value, the maximum, of the entire matrix c.
[yRaw xRaw]=find(c==max(c(:))); 
yIndex=yRaw-size(glyph,1)+1; %to locate the y (rows) exact position of the found 
       %template in the image, it is necessary rest the size of rows of the template 
       %and then add one.
xIndex=xRaw-size(glyph,2)+1;%the same for columns.

disp([yIndex xIndex]);
subplot(2,2,3);
imshow(tablet);
hold on;
plot(xIndex,yIndex, 'r+', 'markersize', 16);
hold off;
title('Found template');
impixelinfo



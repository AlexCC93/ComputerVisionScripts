function FindTemplateInImage()
tablet = imread('tablet.png');
% disp(size(tablet));
subplot(2,2,1);
imshow(tablet);
title('Orignial image');
glyph = tablet(75:165, 150:185);
subplot(2,2,2);
imshow(glyph);
title('Template image');
% disp(size(glyph));
impixelinfo
[y x]=findTemplate2D(glyph,tablet);
disp([y x]);
subplot(2,2,3);
imshow(tablet);
hold on;
plot(x,y, 'r+', 'markersize', 16);
hold off;
title('Found template');
end

function [yIndex xIndex] = findTemplate2D(template,image)
   c=normxcorr2(template,image)
%max(c) returns a vector with the maximum values of all the columns.
%c(:), all the values contained in c get into one single column.
%max(c(:)), returns the maximum value among all the values contained in c.
    [yRaw xRaw]=find(c==max(c(:))); 
    yIndex=yRaw-size(template,1)+1; %to locate the y (rows) exact position of the found 
               %template in the image, it is necessary rest the size of rows of the template 
               %and then add one.
    xIndex=xRaw-size(template,2)+1;%the same for columns.
% % %     aux=max(c(:));
% % %     disp(aux);
% % %     subplot(2,2,3);
% % %     imshow(aux);
end
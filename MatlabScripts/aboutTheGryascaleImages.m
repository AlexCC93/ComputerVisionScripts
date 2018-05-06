%% Creating grayscale image
a=[0 0 0 0 0;10 10 10 10 10;70 70 70 70 70;150 150 150 150 150;...
    250 250 250 250 250] 
figure()
subplot(1,2,1)
imshow(a), title('Just showing a')%Expected a grayscale image where the first row is black and
    %the next ones are gray until the final row which is white.
subplot(1,2,2)
% imshow(a, []), title('Showing a,[]') %With this command the results expected are obtained. One 
    %could also convert the type of a to be uint8.
imshow(uint8(a)), title('Showing a, converted to uint8') %converting to uint8 from double.
